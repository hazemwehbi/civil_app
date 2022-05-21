<!-- Employees -->
<template>
    <div class="component-wrap">
        <Create ref="supportAdd"></Create>
        <Edit ref="supportEdit"></Edit>
        <view1 ref="supportView"></view1>

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
                        {{ trans('data.contract_requests') }}
                    </div>
                </div>

            </v-card-title>
            <v-divider></v-divider>
            <!-- data table -->
            <v-data-table v-bind:headers="headers" v-bind:pagination.sync="pagination" :items="items"
                :total-items="totalItems" class="elevation-3">
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
                            <v-btn small fab dark color="success" @click="viewSupport(props.item)">
                                <v-icon color="white">info</v-icon>
                            </v-btn>

                            <v-btn color="primary" v-if="
                                props.item.support_request_users != undefined
                                    ? props.item.support_request_users.filter(
                                        (x) =>
                                            x.is_sent == 0 &&
                                            x.support_id == getCurrentUser().id
                                    ).length > 0
                                    : false
                            " small fab :disabled="!checkActive()"
                                @click="createReport(props.item.support_request_users)">
                                <v-icon color="white"> list </v-icon>
                                <!-- {{trans('messages.cancel')}}-->
                            </v-btn>

                        </div>
                    </td>

                    <td>
                        <div align="center">{{ props.item.id }}</div>
                    </td>
                    <!-- <td>
                        <div align="center">
                            <avatar :members="props.item.supporters" class="mr-2"></avatar>
                        </div>
                    </td> -->
                    <td>
                        <div align="center">
                            <v-chip class="ma-2" :disabled="!checkActive()" v-if="props.item.status != ''"
                                :color="getStatus(props.item.support_request_users).color" text-color="white">
                                {{ getStatus(props.item.support_request_users).status }}
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
                            <v-btn small fab dark color="teal" @click="viewProject(props.item.project_id)">
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
            <v-btn style="background-color: #06706d; color: white" @click="$router.go(-1)" :loading="loading"
                :disabled="loading">
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
export default {
    components: {
        view1,
        Create,
        Edit,
        // View,
    },
    data() {
        const self = this;
        return {
            dialog: false,
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
                // {
                //     text: self.trans('data.supporters'),
                //     value: 'supporters',
                //     align: 'center',
                //     sortable: false,
                // },
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
            ['SUPPORT_ADDED', 'SUPPORT_UPDATED', 'SUPPORT_DELETED', 'SUPPORT_ADDED'],
            () => {
                self.loadRequests(() => { });
            }
        );
    },
    watch: {
        'pagination.page': function () {
            this.loadRequests(() => { });
        },
        'pagination.rowsPerPage': function () {
            this.loadRequests(() => { });
        },
        'filters.name': _.debounce(function () {
            const self = this;
            self.loadRequests(() => { });
        }, 700),
    },
    methods: {
        createReport(support_request_users) {
            const self = this;
            var data = support_request_users.length > 0
                ? support_request_users.find(
                    (x) =>
                        x.price == null &&
                        x.support_id == self.getCurrentUser().id
                ) : null;
            self.$router.push({
                name: 'create_report_price_contract',
                params: {
                    id: data != undefined ? data.id : null,
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
            self.$refs.supportAdd.create();
        },

        viewSupport(item) {
            const self = this;
            self.$refs.supportView.create(item);
        },



        loadRequests(cb) {
            const self = this;
            let params = {
                page: self.pagination.page,
                rowsPerPage: self.pagination.rowsPerPage,
            };

            axios
                .get('/contract_company/request-contract', { params: params })
                .then(function (response) {
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
        getStatus(support_request_users) {
            const self = this;
            var support = support_request_users.find((x) => x.support_id == self.getCurrentUser().id);

            if (support.is_sent == 0 && (support.is_rejected == 0 && support.is_accept == 0)) {
                var obj = {
                    'status': self.trans('data.new') ,
                    'color': 'red'
                }
                return obj
            }
            else if (support.is_sent == 1 && (support.is_rejected == 0 && support.is_accept == 0)) {
                var obj = {
                    'status':   self.trans('data.in_progress'),
                    'color': 'orange'
                }
                return obj
            }
            else if (support.is_sent == 1 && (support.is_accept == 1 )) {
                var obj = {
                    'status': self.trans('data.accepted'),
                    'color': 'green'
                }
                return obj
            }
            else if (support.is_sent == 1 && (support.is_rejected == 1 )) {
                var obj = {
                    'status':  self.trans('data.rejected') ,
                    'color': 'yollow'
                }
                return obj
            }

        },
        getColor(status) {
            if (status == 'new') {
                return 'red';
            }
            else if (status == 'pending') {
                return 'yellow';
            } else if (status == 'sent') {
                return 'blue';
            } else if (status == 'accepted') {
                return 'green';
            } else if (status == 'rejected') {
                return 'yollow';
            } else if (status == 'completed') {
                return '#06706d';
            } else if (status == 'in_progress') {
                return 'orange';
            }
        },
    },
};
</script>
