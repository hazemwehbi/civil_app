<template>
    <div class="component-wrap">
        <v-container grid-list-md>
        <v-layout row pt-3>
            <v-flex xs12 sm12>
                <v-card class="elevation-3">
                    <v-card-title primary-title xs8 sm8>
                        <div>
                            <div class="headline">
                                {{ trans('data.complated_projects') }}
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
                                                <td>
                                                    <v-menu
                                                        transition="slide-x-transition"
                                                        right
                                                        v-if="
                                                            $can('project.' + props.item.id + '.status') ||
                                                                $can('project.' + props.item.id + '.edit') ||
                                                                $can('project.' + props.item.id + '.delete')
                                                        "
                                                    >
                                                        <v-btn slot="activator" icon>
                                                            <v-icon>more_vert</v-icon>
                                                        </v-btn>

                                                        <v-list>
                                                            <v-list-tile
                                                                @click="
                                                                    $router.push({
                                                                        name: 'projects.project-tasks.list',
                                                                        params: { id: props.item.id },
                                                                    })
                                                                "
                                                            >
                                                                <v-list-tile-title>
                                                                    <v-icon small>
                                                                        visibility
                                                                    </v-icon>
                                                                    {{ trans('messages.view') }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>
                                                            <!-- status -->
                                                            <v-menu
                                                                transition="slide-x-transition"
                                                                offset-x
                                                                open-on-hover
                                                            >
                                                                <v-list-tile
                                                                    slot="activator"
                                                                    v-if="
                                                                        $can(
                                                                            'project.' + props.item.id + '.status'
                                                                        )
                                                                    "
                                                                >
                                                                    <v-list-tile-title>
                                                                        <v-icon small> check </v-icon>
                                                                        {{ trans('messages.status') }}
                                                                    </v-list-tile-title>
                                                                </v-list-tile>
                                                                <v-list dense>
                                                                    <v-list-tile
                                                                        :disabled="
                                                                            props.item.status === status.key
                                                                        "
                                                                        @click="
                                                                            updateStatus(status.key, props.item)
                                                                        "
                                                                        v-for="status in statuses"
                                                                        :key="status.key"
                                                                    >
                                                                        <v-list-tile-title>
                                                                            {{ status.value }}
                                                                        </v-list-tile-title>
                                                                    </v-list-tile>
                                                                </v-list>
                                                            </v-menu>
                                                            <!-- /status -->
                                                            <v-list-tile
                                                                v-if="$can('project.' + props.item.id + '.edit')"
                                                                @click="edit(props.item.id)"
                                                            >
                                                                <v-list-tile-title>
                                                                    <v-icon small> edit </v-icon>
                                                                    {{ trans('messages.edit') }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>
                                                            <v-list-tile
                                                                v-if="$can('project.' + props.item.id + '.delete')"
                                                                @click="deleteProject(props.item.id)"
                                                            >
                                                                <v-list-tile-title>
                                                                    <v-icon small> delete_outline </v-icon>
                                                                    {{ trans('messages.delete') }}
                                                                </v-list-tile-title>
                                                            </v-list-tile>
                                                        </v-list>
                                                    </v-menu>
                                                </td>
                                                <td>{{ props.item.name }}</td>
                                                <td> {{ props.item.customer.company }}</td>
                                                <td>
                                                    <v-btn icon @click="markAsFavorite(props.item)">
                                                        <v-icon :color="toggleFavorite(props.item)"> star </v-icon>
                                                    </v-btn>
                                                </td>
                                                <td><avatar :members="props.item.members" class="mr-2"></avatar></td>
                                            </template>
                                        </v-data-table>
                                    </v-flex>
                                </v-layout>
                        </v-container>
                    </v-card-text>
                </v-card>
            </v-flex>
        </v-layout>
        <br>
            <div align="right">
                <v-btn style="background-color:#06706d;color:white;" @click="$router.go(-1)">
                    {{ trans('messages.back') }}
                </v-btn>
           </div>
        <br>
        </v-container>
    </div>
</template>

<script>
import avatar from '../components/Avatar';
export default {
    components: {
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
                    align: 'left',
                    sortable: false,
                },
                {
                    text: self.trans('messages.name'),
                    value: 'name',
                    align: 'left',
                    sortable: true,
                },
                {
                    text: self.trans('messages.company'),
                    value: 'company',
                    align: 'left',
                    sortable: true,
                },
                {
                    text: self.trans('messages.favorited'),
                    value: 'favorited',
                    align: 'left',
                    sortable: true,
                },
                {
                    text: self.trans('messages.members'),
                    value: 'members',
                    align: 'left',
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
        self.$eventBus.$on('updateProjectTable', data => {
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
            params['status'] = 'completed';
           
            axios
                .get(self.url, {
                    params: params,
                })
                .then(function(response) {
                    self.loading = false;
                    self.projectData = _.concat(self.projectData, response.data.projects.data);
                    self.statuses = response.data.status;
                    self.url = _.get(response, 'data.projects.next_page_url', null);
                    self.getStatistics();
                })
                .catch(function(error) {
                    console.log(error);
                });
        },
        edit(id) {
            const self = this;
            self.$refs.projectEdit.edit(id);
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
                        .then(function(response) {
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
                        .catch(function(error) {
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
                .then(function(response) {
                    self.$store.commit('showSnackbar', {
                        message: response.data.msg,
                        color: response.data.success,
                    });
                    project.is_favorited = response.data.favorite;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },
        updateStatus(status, project) {
            const self = this;
            axios
                .get('/projects/update-status', {
                    params: { id: project.id, status: status },
                })
                .then(function(response) {
                    self.$store.commit('showSnackbar', {
                        message: response.data.msg,
                        color: response.data.success,
                    });

                    if (response.data.success === true) {
                        project.status = status;
                        self.getStatistics();
                    }
                })
                .catch(function(error) {
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
                    .then(function(response) {
                        self.users = _.concat(self.users, response.data.users);
                        self.customers = _.concat(self.customers, response.data.customers);
                        self.status = _.concat(self.status, response.data.status);
                        self.categories = _.concat(self.categories, response.data.categories);
                    })
                    .catch(function(error) {
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
                    .then(function(response) {
                        self.statistics = response.data;
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            }
        },
    },
};
</script>