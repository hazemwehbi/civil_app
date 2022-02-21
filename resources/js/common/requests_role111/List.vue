<template>
    <v-container grid-list-md>
        <v-card>
            <v-card-title>
                <div>
                    <div class="headline">
                        {{ trans('messages.documents_notes') }}
                    </div>
                </div>
                <!-- <v-spacer></v-spacer>
                <v-btn style="background-color:#06706d;color:white;" class="lighten-1" dark  @click="$router.push({name: 'add_report', params: {project:props.item }})">
                    {{ trans('messages.add') }}
                    <v-icon right dark>add</v-icon>
                </v-btn> -->
            </v-card-title>
            <v-divider></v-divider>
            <!-- v-datatable -->
            <v-data-table
                :headers="headers"
                :pagination.sync="pagination"
                :total-items="total_items"
                :loading="loading"
                :items="items"
                class="elevation-3"
            >
                <template slot="items" slot-scope="props">
                                      <td>
                        <div style="display: inline-flex; padding-left: 30%" align="center">
                            <!-- v-if="!$can('superadmin')" -->
                            <div>
                                <v-btn
                                    color="primary"
                                    small
                                    fab
                                    v-if="props.item.sent == 0"
                                    dark
                                    
                                >
                                    <v-icon color="white">edit</v-icon>
                                    <!--{{trans('data.accept')}}-->
                                </v-btn>
                            </div>
                            <v-btn
                                color="error"
                                small
                                fab
                                dark
                            >
                                <v-icon color="white">delete</v-icon>
                                <!-- {{trans('messages.cancel')}}-->
                            </v-btn>
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            {{ props.item.user.name }}
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            {{ getType(props.item.role.name) }}
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            {{ getType(props.item.note) }}
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            {{ props.item.created_at | formatDate }}
                        </div>
                    </td>

                </template>
            </v-data-table>
        </v-card>
        <br />
        <div align="center">
            <v-btn style="background-color: #06706d; color: white" @click="$router.go(-1)">
                {{ trans('messages.back') }}
            </v-btn>
        </div>
    </v-container>
</template>
<script>
export default {
    components: {},
    data() {
        const self = this;
        return {
            total_items: 0,
            loading: true,
            pagination: { totalItems: 0, sortBy: 'created_at', descending: true },
            items: [],
            headers: [
                {
                    text: self.trans('messages.action'),
                    value: false,
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('data.requester'),
                    value: 'requester',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('data.role_name'),
                    value: 'role_name',
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('data.note'),
                    value: 'note',
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('data.created_at'),
                    value: 'created_at',
                    align: 'center',
                    sortable: true,
                },
            ],
        };
    },
    watch: {
        pagination: {
            handler() {
                const self = this;
                self.getRequestsRole();
            },
        },
    },
    created() {
        const self = this;
        self.getRequestsRole();
    },
    beforeDestroy() {
        const self = this;
        //self.$eventBus.$off('updateProjectNotesTable');
    },
    methods: {
        getRequestsRole() {
            const self = this;
            self.loading = true;
            const { sortBy, descending, page, rowsPerPage } = self.pagination;
            axios
                .get('/requests-role', {
                    params: {
                        sort_by: sortBy,
                        descending: descending,
                        page: page,
                        rowsPerPage: rowsPerPage,
                    },
                })
                .then(function (response) {
                    self.total_items = response.data.total;
                    self.items = response.data.data;
                    self.loading = false;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },

        getType(type) {
            const self = this;
            if (type != null) {
                return self.report_types.find((o) => o.key == type).value;
            } else {
                return null;
            }
        },

        deleteRequest(item) {
            const self = this;
            self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                message: self.trans('messages.you_cant_restore_it'),
                okCb: () => {
                    axios
                        .delete('reports/' + item.id, {
                            params: { project_id: self.projectId },
                        })
                        .then(function (response) {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });

                            if (response.data.success === true) {
                                self.getProjectNotes();
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
                },
                cancelCb: () => {
                    console.log('CANCEL');
                },
            });
        },
    },
};
</script>
