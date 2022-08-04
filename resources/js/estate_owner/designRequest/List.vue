<!-- Employees -->
<template>
    <div class="component-wrap">
        <Create ref="designAdd"></Create>
        <Edit ref="designEdit"></Edit>
        <view1 ref="designView"></view1>
        <PricePdf ref="pdfPrice" />
        <!-- <v-tabs v-model="tabs" fixed-tabs height="47" class="elevation-3">
            <v-tab :href="'#tab-1'" @click="getStatistics">
                <v-icon>bar_chart</v-icon>
                {{ trans('messages.statistics') }}
            </v-tab>

            <v-tab :href="'#tab-2'">
                <v-icon>filter_list</v-icon>
                {{ trans('messages.filters') }}
            </v-tab>
        </v-tabs>

        <v-tabs-items v-model="tabs">
            <v-divider></v-divider>
            <v-tab-item :value="'tab-1'">
                <v-card flat class="elevation-2">
                    <v-card-text>
                        <v-container grid-list-md>
                            <v-layout row wrap>
                                <v-flex xs12 sm3 md3 v-if="statistics.users > 0">
                                    <span class="subheading font-weight-medium info--text">
                                        {{ trans('messages.total') }}: {{ statistics.users }}
                                    </span>
                                </v-flex>
                                <v-flex xs12 sm3 md3 v-if="statistics.active > 0">
                                    <span class="subheading font-weight-medium success--text">
                                        {{ trans('messages.active') }}: {{ statistics.active }}
                                    </span>
                                </v-flex>
                                <v-flex xs12 sm3 md3 v-if="statistics.in_active > 0">
                                    <span class="subheading font-weight-medium warning--text">
                                        {{ trans('messages.in_active') }}:
                                        {{ statistics.in_active }}
                                    </span>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-card-text>
                </v-card>
            </v-tab-item>
            <v-tab-item :value="'tab-2'">
                <v-card flat class="elevation-2">
                    <v-card-text>
                        <v-layout>
                            <v-flex xs12 sm12>
                                <v-container grid-list-md>
                                    <v-layout row wrap>
                                        <v-flex xs12 sm6 md6>
                                            <v-text-field
                                                prepend-icon="search"
                                                :label="trans('messages.filter_by_name')"
                                                v-model="filters.name"
                                            ></v-text-field>
                                        </v-flex>
                                        <v-flex xs12 sm6 md6>
                                            <v-text-field
                                                prepend-icon="search"
                                                :label="trans('messages.filter_by_email')"
                                                v-model="filters.email"
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-container>
                            </v-flex>
                        </v-layout>
                    </v-card-text>
                </v-card>
            </v-tab-item>
        </v-tabs-items> -->
        <v-card class="mt-3">
            <v-card-title>
                <div>
                    <div class="headline">
                        {{ trans('data.design_requests') }}
                    </div>
                </div>
                <v-spacer></v-spacer>
                <v-btn
                    :disabled="!checkActive()"
                    @click="create()"
                    style="background-color: #06706d; color: white"
                    class="lighten-1"
                >
                    {{ trans('data.create_design') }}
                    <v-icon right dark>add</v-icon>
                </v-btn>
            </v-card-title>
            <v-divider></v-divider>
            <!-- data table -->
            <v-data-table
                v-bind:headers="headers"
                v-bind:pagination.sync="pagination"
                :items="items"
                :total-items="totalItems"
                class="elevation-3"
            >
                <template slot="headerCell" slot-scope="props">
                    <span v-if="props.header.value == 'created_by'">
                        <v-icon small>person</v-icon> {{ props.header.text }}
                    </span>
                    <span v-else-if="props.header.value == 'email'">
                        <v-icon small>email</v-icon> {{ props.header.text }}
                    </span>
                    <span v-else-if="props.header.value == 'roles'">
                        <v-icon small>control_point</v-icon> {{ props.header.text }}
                    </span>
                    <span v-else-if="props.header.value == 'created_at'">
                        <v-icon small>av_timer</v-icon> {{ props.header.text }}
                    </span>
                    <span v-else>{{ props.header.text }}</span>
                </template>
                <template slot="items" slot-scope="props">
                    <td>
                        <div style="display: inline-flex; padding-left: 30%" align="center">
                            <v-btn small fab dark color="success" @click="viewDesign(props.item)">
                                <v-icon color="white">info</v-icon>
                            </v-btn>
                              <v-btn small fab dark color="success" v-if="props.item.status == 'in_progress'" @click="viewDesignPrice(props.item)">
                                <v-icon color="white" style="margin-top: -0.3rem;">$</v-icon>
                            </v-btn>
                            <v-btn
                                v-if="props.item.status == 'new'"
                                :disabled="!checkActive()"
                                small
                                fab
                                color="success"
                                @click="edit(props.item)"
                            >
                                <v-icon color="white">edit</v-icon>
                            </v-btn>
                            <div>
                                <v-btn
                                    color="primary"
                                    small
                                    fab
                                    :disabled="!checkActive()"
                                    v-if="props.item.sent == 0 && props.item.status == 'new'"
                                    @click="sendRequest(props.item.id)"
                                >
                                    <v-icon color="white">mail</v-icon>
                                    <!--{{trans('data.accept')}}-->
                                </v-btn>
                            </div>

                            <v-btn
                                color="error"
                                :disabled="!checkActive()"
                                v-if="props.item.status == 'new' || props.item.status == 'rejected'"
                                small
                                fab
                                @click="trash(props.item.id)"
                            >
                                <v-icon color="white">delete</v-icon>
                                <!-- {{trans('messages.cancel')}}-->
                            </v-btn>
                        </div>
                    </td>

                    <td>
                        <div align="center">{{ props.item.id }}</div>
                    </td>

                    <td>
                        <div align="center">
                            <v-chip
                                class="ma-2"
                                :disabled="!checkActive()"
                                v-if="props.item.status != ''"
                                :color="getColor(props.item.status)"
                                text-color="white"
                            >
                                {{ props.item.status }}
                            </v-chip>
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            {{ props.item.customer.name }}
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            <span v-for="(office,index) in props.item.offices" :key="office.id"> {{ office.name }}<span v-if="index != props.item.offices.length-1">, </span> </span>
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            <v-btn
                                small
                                fab
                                dark
                                color="teal"
                                @click="viewProject(props.item.project_id)"
                            >
                                {{ props.item.project.name }}
                                <!-- {{trans('messages.add')}}-->
                            </v-btn>
                        </div>
                    </td>

                    <td>
                        <div align="center">
                            {{ props.item.created_at ? createdDate(props.item.created_at) : '-' }}
                        </div>
                    </td>
                </template>
            </v-data-table>
        </v-card>
        <br />
        <div align="center">
            <v-btn
                style="background-color: #06706d; color: white"
                @click="$router.go(-1)"
                :loading="loading"
                :disabled="loading"
            >
                {{ trans('messages.back') }}
            </v-btn>
        </div>
        <br />
    </div>
</template>

<script>
import Create from './Create';
import Edit from './Edit';
import view1 from './view1';
import _ from 'lodash';
import PricePdf from './PricePdf.vue'
export default {
    components: {
        view1,
        Create,
        Edit,
       PricePdf
    },
    data() {
        const self = this;
        return {
            dialog: false,
            loading: false,
            headers: [
                {
                    text: self.trans('messages.action'),
                    value: false,
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('messages.id'),
                    value: 'id',
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('messages.status'),
                    value: 'status',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.customer'),
                    value: 'customer',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('data.office'),
                    value: 'offices.name',
                    align: 'center',
                    sortable: true,
                    
                },
                {
                    text: self.trans('data.project_name'),
                    value: 'project_name',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.created_at'),
                    value: 'created_at',
                    align: 'center',
                    sortable: true,
                },
            ],
            items: [],
            totalItems: 0,
            pagination: {
                rowsPerPage: 10,
            },

            tabs: 'tab-1',
            filters: {
                name: '',
            },
        };
    },
    mounted() {
        const self = this;
        self.$eventBus.$on(
            ['DESIGN_ADDED', 'DESIGN__UPDATED', 'DESIGN__DELETED', 'DESIGN__ADDED'],
            () => {
                self.loadDesigns(() => {});
            }
        );
    },
    watch: {
        'pagination.page': function () {
            this.loadDesigns(() => {});
        },
        'pagination.rowsPerPage': function () {
            this.loadDesigns(() => {});
        },
        'filters.name': _.debounce(() => {
            const self = this;
            self.loadDesigns(() => {});
        }, 700),
    },
    methods: {
        sendRequest(id) {
            const self = this;
            self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                okCb: () => {
                    axios
                        .post('/estate_owner/confirm-design', { design_id: id })
                        .then(function (response) {
                            if (response.data.success === true) {
                                self.$eventBus.$emit('DESIGN__UPDATED');
                                self.$store.commit('showSnackbar', {
                                    message: response.data.msg,
                                    color: response.data.success,
                                });
                            } else {
                                self.$store.commit('showSnackbar', {
                                    message: response.data.msg,
                                    color: response.data.success,
                                });
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
        createdDate(date) {
            const current_datetime = new Date(date);
            return current_datetime.toLocaleDateString('en-US');
        },
        viewProject(id) {
            const self = this;
            self.$router.push({
                name: 'view_project',
                params: { id: id },
            });
        },
        create() {
            const self = this;
            self.$refs.designAdd.create();
        },
        edit(item) {
            const self = this;
            self.$refs.designEdit.create(item);
        },
        viewDesign(item) {
            const self = this;
             self.$refs.designView.create(item);
        },
        viewDesignPrice(item){
           const self = this;
            self.$refs.pdfPrice.openDialog(item)
        },
        createdDate(date) {
            const current_datetime = new Date(date);
            return current_datetime.toLocaleDateString('en-US');
        },
        trash(id) {
            const self = this;
            self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                message: self.trans('messages.you_cant_restore_it'),
                okCb: () => {
                    axios
                        .delete('/estate_owner/request-design/' + id)
                        .then(function (response) {
                            if (response.data.success === true) {
                                self.$eventBus.$emit('DESIGN__DELETED');
                                self.$store.commit('showSnackbar', {
                                    message: response.data.msg,
                                    color: response.data.success,
                                });
                            } else {
                                self.$store.commit('showSnackbar', {
                                    message: response.data.msg,
                                    color: response.data.success,
                                });
                            }
                        })
                        .catch(function (error) {
                            self.$store.commit('hideLoader');

                            if (error.response) {
                                self.$store.commit('showSnackbar', {
                                    message: error.response.data.msg,
                                    color: response.data.success,
                                });
                            } else if (error.request) {
                                console.log(error.request);
                            } else {
                                console.log('Error', error.message);
                            }
                        });
                },
                cancelCb: () => {
                    console.log('CANCEL');
                },
            });
        },

        loadDesigns(cb) {
            const self = this;
            let params = {
                page: self.pagination.page,
                rowsPerPage: self.pagination.rowsPerPage,
            };

            axios.get('/estate_owner/request-design', { params: params }).then(function (response) {
                if (response.data.success === true) {
                    self.items = response.data.msg.data;
                    self.totalItems = response.data.msg.total;
                    self.pagination.totalItems = response.data.msg.total;
                } else {
                    self.$store.commit('showSnackbar', {
                        message: response.data.msg,
                        color: response.data.success,
                    });

                    self.$store.commit('hideLoader');
                }
            });
        },

        getColor(status) {
            if (status == 'new') {
                return 'red';
            } else if (status == 'pending') {
                return 'yellow';
            } else if (status == 'sent') {
                return 'blue';
            } else if (status == 'accepted') {
                return 'green';
            } else if (status == 'rejected') {
                return 'yollow';
            }
            else if(status=='completed'){
                return '#06706d';

            }
             else if(status=='in_progress'){
                return 'orange';

            }
        },
    },
};
</script>
