<template>
    <div>
        <!-- create project -->
        <ProjectFormAdd ref="projectAdd"></ProjectFormAdd>
        <!-- Edit project -->
        <ProjectFormEdit ref="projectEdit"></ProjectFormEdit>
        <v-container grid-list-md>
            <v-layout row pt-3>
                <v-flex xs12 sm12>
                    <v-card class="elevation-3">
                        <v-card-title primary-title xs8 sm8>
                            <div>
                                <div class="headline">
                                    {{ trans('data.current_projects') }}
                                </div>
                            </div>
                        </v-card-title>
                        <v-divider></v-divider>
                        <v-card-text>
                            <v-container grid-list-md>
                                <v-layout wrap>
                                    <v-flex xs12 sm12 md12>
                                        <v-data-table
                                            :headers="headers"
                                            :pagination.sync="pagination"
                                            :total-items="total_items"
                                            :loading="loading"
                                            :items="projectData"
                                            class="elevation-3"
                                        >
                                            <template slot="items" slot-scope="props">
                                                <td >
                                                 <div align="center">
                                                    <v-menu>
                                                        <v-btn icon slot="activator">
                                                            <v-icon>more_vert</v-icon>
                                                        </v-btn>
                                                        <v-list>
                                                            <v-list-tile
                                                                v-if="$can('tickets.create')"
                                                                @click="
                                                                    $router.push({
                                                                        name: 'create_visit_request_list',
                                                                        params: {
                                                                            project_id:
                                                                                props.item.id,
                                                                            customer_id:
                                                                                props.item
                                                                                    .customer_id,
                                                                            request_type:
                                                                                'visit_request',
                                                                        },
                                                                    })
                                                                "
                                                            >
                                                                <v-list-tile-title>
                                                                    {{
                                                                        trans(
                                                                            'data.create_a_visit_request'
                                                                        )
                                                                    }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>

                                                            <v-list-tile
                                                                @click="
                                                                    deleteProject(props.item.id)
                                                                "
                                                                v-if="$can('project.delete')"
                                                            >
                                                                <v-list-tile-title>
                                                                    {{ trans('messages.delete') }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>
                                                            <v-list-tile
                                                                @click="edit(props.item)"
                                                                v-if="$can('project.edit')"
                                                            >
                                                                <v-list-tile-title>
                                                                    {{ trans('messages.edit') }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>
                                                            <v-list-tile
                                                                @click="view(props.item)"
                                                                v-if="$can('project.list')"
                                                            >
                                                                <v-list-tile-title>
                                                                    {{ trans('data.view') }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>

                                                            <v-list-tile
                                                                @click="
                                                                    $router.push({
                                                                        name: 'add_report',
                                                                        params: {
                                                                            project: props.item,
                                                                        },
                                                                    })
                                                                "
                                                            >
                                                                <v-list-tile-title>
                                                                    {{
                                                                        trans(
                                                                            'data.create_a_report'
                                                                        )
                                                                    }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>

                                                            <v-list-tile>
                                                                <v-list-tile-title>
                                                                    {{
                                                                        trans('data.reports_review')
                                                                    }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>

                                                            <v-list-tile
                                                                @click="
                                                                    $router.push({
                                                                        name: 'project.schedule',
                                                                        params: {
                                                                            project_id:
                                                                                props.item.id,
                                                                        },
                                                                    })
                                                                "
                                                            >
                                                                <v-list-tile-title>
                                                                    {{ trans('data.schedule') }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>

                                                            <v-list-tile
                                                                @click="
                                                                    $router.push({
                                                                        name: 'project.attachments',
                                                                        params: {
                                                                            project_id:
                                                                                props.item.id,
                                                                        },
                                                                    })
                                                                "
                                                            >
                                                                <v-list-tile-title>
                                                                    {{ trans('data.attachments') }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>

                                                            <v-list-tile @click="$router.push({})">
                                                                <v-list-tile-title>
                                                                    {{ trans('messages.invoices') }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>
                                                        </v-list>
                                                    </v-menu>
                                                    <!--      <div style="display: flex;">
                                                            <v-btn color="success" small v-if=" $can('project.' + props.item.id + '.status') ||
                                                                    $can('project.' + props.item.id + '.edit') ||
                                                                    $can('project.' + props.item.id + '.delete')
                                                            " slot="activator"  @click="$router.push({name: 'projects.project-tasks.list',params: { id: props.item.id }})">
                                                                <v-icon small>visibility</v-icon>&nbsp;
                                                                {{ trans('messages.view') }}
                                                            </v-btn>
                                                            <v-btn color="primary" small slot="activator" v-if="$can('project.' + props.item.id + '.edit')"  @click="$router.push({name: 'projects.project-tasks.list',params: { id: props.item.id }})">
                                                                <v-icon small>edit</v-icon>&nbsp;
                                                                {{ trans('messages.edit') }}
                                                            </v-btn>
                                                            <v-btn color="error" small slot="activator"  v-if="$can('project.' + props.item.id + '.delete')"
                                                                    @click="deleteProject(props.item.id)">
                                                                <v-icon small>delete_outline</v-icon>&nbsp;
                                                                {{ trans('messages.delete') }}
                                                            </v-btn>
                                                        </div>  -->

                                                    <!-- <td>{{ props.item.id }}</td> -->
                                                     </div>
                                                </td>

                                                <td>
                                                 <div align="center">
                                                  {{ props.item.name }}
                                                 </div>
                                               </td>
                                                <!-- <td> {{ props.item.customer.company }}</td> -->
                                                <td >
                                                  <div align="center">

                                                               <v-chip
                                                        class="ma-2"
                                                        color="red"
                                                        text-color="white"
                                                        >{{
                                                            trans('messages.' + props.item.status)
                                                        }}
                                                    </v-chip>


                                                 </div>
                                       
                                                </td>
                                                <td >
                                                <div align="center">
                                                    <v-btn icon @click="markAsFavorite(props.item)">
                                                        <v-icon :color="toggleFavorite(props.item)">
                                                            star
                                                        </v-icon>
                                                    </v-btn>
                                                     </div>
                                                </td>
                                               
                                                <td >
                                                 <div align="center">
                                                    <avatar
                                                        :members="props.item.members"
                                                        class="mr-2"
                                                    ></avatar>
                                                     </div>
                                                </td>
                                                <td >
                                                <div align="center">
                                                    {{
                                                        projectProgress(
                                                            props.item.tasks_count,
                                                            props.item.completed_task
                                                        )
                                                    }}
                                                </div>
                                                </td>
                                            </template>
                                        </v-data-table>
                                    </v-flex>
                                </v-layout>
                            </v-container>
                        </v-card-text>
                    </v-card>
                </v-flex>
            </v-layout>
            <br />
            <div align="center">
                <v-btn style="background-color: #06706d; color: white" @click="$router.go(-1)">
                    {{ trans('messages.back') }}
                </v-btn>
            </div>
            <br />
        </v-container>
    </div>
</template>

<script>
import ProjectFormAdd from '../components/Add';
import ProjectFormEdit from '../components/Edit';
import avatar from '../components/Avatar';

export default {
    components: {
        ProjectFormAdd,
        ProjectFormEdit,
        avatar,
    },
    data() {
        const self = this;
        return {
            total_items: 0,
            items: [],
            pagination: { totalItems: 0 },
            headers: [
                {
                    text: self.trans('messages.action'),
                    value: false,
                    align: 'center',
                    sortable: false,
                },
                // {
                //     text: self.trans('messages.id'),
                //     value: 'id',
                //     align: 'left',
                //     sortable: true,
                // },
                {
                    text: self.trans('messages.name'),
                    value: 'name',
                    align: 'center',
                    sortable: true,
                },
                // {
                //     text: self.trans('messages.company'),
                //     value: 'company',
                //     align: 'left',
                //     sortable: true,
                // },
                {
                    text: self.trans('messages.status'),
                    value: 'status',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.favorited'),
                    value: 'favorited',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.members'),
                    value: 'members',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.project_progress'),
                    value: 'project_progress',
                    align: 'center',
                    sortable: true,
                },
            ],
            projectData: [],
            statuses: [],
            url: null,
            users: [{ id: 0, name: self.trans('messages.all') }],
            customers: [{ id: 0, company: self.trans('messages.all') }],
            status: [{ key: '', value: self.trans('messages.all') }],
            categories: [{ id: 0, name: self.trans('messages.all') }],
            filters: [],
            tabs: 'tab-1',
            statistics: [],
            loading: false,
        };
    },
    created() {
        const self = this;
        self.url = '/projects';
        self.getDataFromApi();
        self.getFilterData();
        self.$eventBus.$on('updateProjectTable', (data) => {
            self.url = '/projects';
            self.projectData = [];
            self.getDataFromApi();
        });
    },
    beforeDestroy() {
        const self = this;
        self.$eventBus.$off('updateProjectTable');
    },
    methods: {
        create() {
            const self = this;
            self.$refs.projectAdd.create();
        },
        getDataFromApi() {
            const self = this;
            self.loading = true;
            var params = {};
            if (self.filters.status) {
                params['status'] = self.filters.status;
            }
            if (self.filters.category_id) {
                params['category_id'] = self.filters.category_id;
            }
            if (self.filters.customer_id) {
                params['customer_id'] = self.filters.customer_id;
            }
            if (self.filters.user_id) {
                params['user_id'] = self.filters.user_id;
            }
            console.log(self.filters.status);
            axios
                .get(self.url, {
                    params: params,
                })
                .then(function (response) {
                    self.loading = false;
                    console.log(response);
                    self.projectData = _.concat(self.projectData, response.data.projects.data);
                    console.log(self.projectData);
                    self.statuses = response.data.status;
                    self.url = _.get(response, 'data.projects.next_page_url', null);
                    self.getStatistics();
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        edit(item) {
            console.log(item);
            const self = this;
            self.$router.push({
                name: 'add-project',
                params: { project_info_edit: item, isEdit: true },
            });

            // self.$refs.projectEdit.edit(id);
        },
        view(item) {
            console.log(item);
            const self = this;
            self.$router.push({
                name: 'add-project',
                params: { project_info_edit: item, isEdit: false },
            });

            // self.$refs.projectEdit.edit(id);
        },
        deleteProject(id) {
            const self = this;

            self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                message: self.trans('messages.you_cant_restore_it'),
                okCb: () => {
                    axios
                        .delete('/projects/' + id)
                        .then(function (response) {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });

                            if (response.data.success === true) {
                                self.url = '/projects';
                                self.projectData = [];
                                self.getDataFromApi();
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
        markAsFavorite(project) {
            const self = this;
            axios
                .get('/projects/mark-favorite', {
                    params: { id: project.id, favorite: project.is_favorited },
                })
                .then(function (response) {
                    self.$store.commit('showSnackbar', {
                        message: response.data.msg,
                        color: response.data.success,
                    });
                    project.is_favorited = response.data.favorite;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        updateStatus(status, project) {
            const self = this;
            axios
                .get('/projects/update-status', {
                    params: { id: project.id, status: status },
                })
                .then(function (response) {
                    self.$store.commit('showSnackbar', {
                        message: response.data.msg,
                        color: response.data.success,
                    });

                    if (response.data.success === true) {
                        project.status = status;
                        self.getStatistics();
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        toggleFavorite(project) {
            if (project.is_favorited) {
                return 'yellow darken-2';
            } else {
                return 'grey lighten-1';
            }
        },
        getFilterData() {
            const self = this;
            if (self.$can('superadmin')) {
                axios
                    .get('/projects/create')
                    .then(function (response) {
                        self.users = _.concat(self.users, response.data.users);
                        self.customers = _.concat(self.customers, response.data.customers);
                        self.status = _.concat(self.status, response.data.status);
                        self.categories = _.concat(self.categories, response.data.categories);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        },

        filterChanged() {
            const self = this;
            self.url = '/projects';
            self.projectData = [];
            self.getDataFromApi();
        },
        getStatistics() {
            const self = this;
            if (self.$can('superadmin')) {
                axios
                    .get('/projects-statistics')
                    .then(function (response) {
                        self.statistics = response.data;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        },
    },
};
</script>