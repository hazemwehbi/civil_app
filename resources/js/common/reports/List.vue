<template>
  <div>
            <v-card-title>
                <div>
                    <div class="headline">
                        {{ trans('data.reports') }}
                    </div>
                </div>
            </v-card-title>
            <v-divider></v-divider>
            <!-- Data table -->
            <v-data-table
                :headers="headers"
                :pagination.sync="pagination"
                :total-items="total_items"
                :loading="loading"
                :items="items"
                class="elevation-3"
            >
                <template slot="items" slot-scope="props">
                    <td align="center">
                        <v-menu>
                            <v-btn icon slot="activator"> <v-icon>more_vert</v-icon> </v-btn>
                            <v-list>

                               <!-- <v-list-tile
                                    v-if="$can('customer.edit')"
                                    @click="edit(props.item.id)"
                                >
                                    <v-list-tile-title>
                                        <v-icon small class="mr-2"> edit </v-icon>
                                        {{ trans('messages.edit') }}
                                    </v-list-tile-title>
                                </v-list-tile> -->

                                <v-list-tile
                                    v-if="$can('customer.delete')"
                                    @click="deleteReport(props.item)"
                                >
                                    <v-list-tile-title>
                                        <v-icon small class="mr-2"> delete_forever </v-icon>
                                        {{ trans('messages.delete') }}
                                    </v-list-tile-title>
                                </v-list-tile>
                            </v-list>
                        </v-menu>
                    </td>
                    <td align="center">{{ props.item.report_creator.name }}</td>
                     <td align="center"></td>
                    <td align="center">{{ props.item.project.name }}</td>
                </template>
        
            </v-data-table>
             <EditReportType :report_type="report_type" :externalDialog="externalDialog" @close="externalDialog = event" @store="externalDialog = event" />
        </div>
        
</template>

<script>
import EditReportType from '../report_types/Edit.vue'
export default {
    components:{
        EditReportType
    },
    data() {
        const self = this;
        return {
            externalDialog: false,
            report_type: {},
            total_items: 0,
            loading: true,
            pagination: { totalItems: 0 },
            headers: [
                {
                    text: self.trans('messages.action'),
                    value: false,
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('data.name'),
                    value: 'name',
                    align: 'center',
                    sortable: true,
                },
                  {
                    text: self.trans('data.contractor'),
                    value: 'reportCreator.name',
                    align: 'center',
                    sortable: true,
                },
                     {
                    text: self.trans('data.project'),
                    value: 'project.name',
                    align: 'center',
                    sortable: true,
                },
             
            ],
            items: [],
            search: '',
            expanded: false,
        };
    },
    watch: {
        pagination: {
            handler() {
                this.getDataFromApi();
            },
        },
    },
    mounted() {
        const self = this;
        console.log(self.items)
        self.$eventBus.$on('updateCustomerTable', data => {
            self.getDataFromApi();
        });
    },
    beforeDestroy() {
        const self = this;
        self.$eventBus.$off('updateCustomerTable');
    },
    methods: {
        getDataFromApi() {
            this.loading = true;

            const { sortBy, descending, page, rowsPerPage } = this.pagination;
            const self = this;
            var params = {
                sort_by: sortBy,
                descending: descending,
                page: page,
                rowsPerPage: rowsPerPage,
            };
            if (self.search) {
                params['term'] = self.search;
            }

            axios
                .get('/reports', {
                    params: params,
                })
                .then(function(response) {
                    self.total_items = response.data.total;
                    self.items = response.data.data;
                    self.loading = false;
                    console.log(self.items)
                })
                .catch(function(error) {
                    console.log(error);
                });
        },
        create() {
            const self = this;
            var templateType = { template: 'customer' };
            self.$refs.customerAdd.create(templateType);
            
        },
        edit(id) {
           const self = this;
            axios
                .get('/reports/' + id +'/edit' )
                .then(function(response) {
                    console.log(response.data);
                    self.report_type = response.data;
                   
                })
                .catch(function(error) {
                    console.log(error);
                });
                 this.externalDialog = true
        },
        deleteReport(item) {
            const self = this;
            self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                message: self.trans('messages.you_cant_restore_it'),
                okCb: () => {
                    axios
                        .delete('/reports/' + item.id )
                        .then(function(response) {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });

                            if (response.data.success === true) {
                                self.getDataFromApi();
                            }
                        })
                        .catch(function(error) {
                            console.log(error);
                        });
                },
                cancelCb: () => {
                    console.log('CANCEL');
                },
            });
        },
        customerContact(item) {
            const self = this;
            self.$router.push({ name: 'customers.contacts.list', params: { id: item.id } });
        },
        searchCustomer() {
            const self = this;
            self.getDataFromApi();
        },
    },
}
</script>

<style>

</style>