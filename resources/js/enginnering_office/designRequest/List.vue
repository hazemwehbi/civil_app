<!-- Employees -->
<template>
    <div class="component-wrap">
        <Create ref="designAdd"></Create>
        <Edit ref="designEdit"></Edit>
        <view1 ref="designView"></view1>
        <AcceptModelDEsignRequest ref="acceptenginneringoffice" />

        <v-card class="mt-3">
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
                            <v-btn 
                            small fab dark color="success" @click="viewDesign(props.item)">
                                <v-icon color="white">info</v-icon>
                            </v-btn>
                            <div>
                                <v-btn
                                    color="primary"
                                    small
                                    fab
                                    v-if="props.item.status == 'sent'"
                                    :disabled="!checkActive()"
                                    @click="acceptProject(props.item)"
                                >
                                    <v-icon color="white">check</v-icon>
                                    <!--{{trans('data.accept')}}-->
                                </v-btn>
                            </div>

                            <v-btn
                                color="primary"
                                v-if="
                                    props.item.design_enginners != undefined
                                        ? props.item.design_enginners.filter(
                                              (x) =>
                                                  x.is_active == 1 &&
                                                  x.is_sent==0 &&
                                                  x.is_agreed == 0 &&
                                                  x.is_rejected == 0 &&
                                                  x.enginner_id == getCurrentUser().id
                                          ).length > 0
                                        : false
                                "
                                small
                                fab
                                :disabled="!checkActive() "
                                @click="createReport(props.item.design_enginners)"
                            >
                                <v-icon color="white"> list </v-icon>
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
                    <td v-if="$hasRole('Engineer')">
                        <div align="center">
                            <v-chip
                                class="ma-2"
                                :disabled="!checkActive()"
                                :color="getColor(props.item.offices.find(val => val.pivot.office_id == getCurrentUser().parent_id).pivot.office_status)"
                                text-color="white"
                            >
                                {{ props.item.offices.find(val => val.pivot.office_id == getCurrentUser().parent_id).pivot.office_status }}
                            </v-chip>
                        </div>
                    </td>
                    <td v-else>
                          <div align="center">
                            <v-chip
                                class="ma-2"
                                :disabled="!checkActive()"
                                :color="getColor(props.item.offices.find(val => val.pivot.office_id == getCurrentUser().id).pivot.office_status)"
                                text-color="white"
                            >
                                {{ props.item.offices.find(val => val.pivot.office_id == getCurrentUser().id).pivot.office_status }}
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
                          {{ props.item.creator.name }}
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
import AcceptModelDEsignRequest from './AcceptModelDEsignRequest';
import _ from 'lodash';
export default {
    components: {
        view1,
        Create,
        Edit,
        AcceptModelDEsignRequest,
        // View,
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
                    text: self.trans('data.office_status'),
                    value: 'office_status',
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
                    text: self.trans('data.created_by'),
                    value: 'creator.name',
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
        createdDate(date) {
            const current_datetime = new Date(date);
            return current_datetime.toLocaleDateString('en-US');
        },
        acceptProject(item) {
            const self = this;
            self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                message: self.trans('messages.are_you_sure'),
                okCb: () => {
                    let data = {
                        status: item.status,
                        id: item.id,
                        office_id: self.getCurrentUser(),
                    };
                    self.$refs.acceptenginneringoffice.create(data);
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
            axios
                .get('enginner_office/request-design', { params: params })
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
              else if (status == 'recieved') {
                return 'cyan';
            }
            else if (status == 'finished') {
                return 'lightgreen';
            }
            else if(status=='completed'){
                return '#06706d';

            }
             else if(status=='in_progress'){
                return 'orange';

            }
        },

        createReport(design_enginners) {
            const self = this;
             var data=design_enginners.length > 0
                                        ? design_enginners.find(
                                              (x) =>
                                                  x.is_active == 1 &&
                                                  x.enginner_id == self.getCurrentUser().id
                                          ): null;
            self.$router.push({
                name: 'create_design_request_price__enginnering_office',
                params: {
                    id: data != undefined ? data.id : null
                },
            });
        },
    },
};
</script>
