<template>
    <v-container grid-list-md>
        <!-- Add notes -->
        <!-- <FormAdd ref="noteAdd"></FormAdd> -->
        <!-- view notes -->
        <NoteShow ref="noteShow" ></NoteShow>
        <!-- edit contact -->
        <NoteEdit ref="noteEdit" @updateReportTable="getProjectNotes($event)"></NoteEdit>

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
                        <v-menu  align="center">
                            <v-btn icon slot="activator"> <v-icon>more_vert</v-icon> </v-btn>
                            <v-list>
                                <!-- <v-list-tile @click="view(props.item.id)">
                                    <v-list-tile-title>
                                        <v-icon small class="mr-2"> visibility </v-icon>
                                        {{ trans('messages.view') }}
                                    </v-list-tile-title>
                                </v-list-tile> -->

                                <v-list-tile @click="edit(props.item.id)">
                                    <v-list-tile-title>
                                        <v-icon small class="mr-2"> edit </v-icon>
                                        {{ trans('data.edit') }}
                                    </v-list-tile-title>
                                </v-list-tile>

                                <v-list-tile @click="deleteNote(props.item)">
                                    <v-list-tile-title>
                                        <v-icon small class="mr-2"> delete_forever </v-icon>
                                        {{ trans('messages.delete') }}
                                    </v-list-tile-title>
                                </v-list-tile>
                            </v-list>
                        </v-menu>
                    </td>
                     <td>
                          <div align="center">
                          {{ props.item.name }}
                        </div>
                     </td>
                   
                    <td>
                          <div align="center">
                           <div class="form-control" 
                            type="text" :id="props.item.id" 
                            readonly 
                            v-html="props.item.description">
                        </div>
                        </div>
                    </td>

                     <td>
                          <div align="center">
                          {{ getType(props.item.type) }}
                        </div>
                     </td>

                      <td>
                          <div align="center">
                          {{ props.item.project.name }}
                        </div>
                     </td>


                      <td>
                          <div align="center">
                          {{ props.item.created_at | formatDate }}
                        </div>
                     </td>                                        


                      <td>
                          <div align="center">
                          {{ props.item.updated_at | formatDate  }}
                        </div>
                     </td>  
                </template>
            </v-data-table>
        </v-card>
        <br>
        <div align="center">
            <v-btn style="background-color:#06706d;color:white;" @click="$router.go(-1)">
                {{ trans('messages.back') }}
            </v-btn>
        </div>
    </v-container>
</template>
<script>
import FormAdd from './Add';
import NoteShow from './View';
import NoteEdit from './Edit';
export default {
    components: {
        FormAdd,
        NoteShow,
        NoteEdit,
    },
    data() {
        const self = this;
        return {
            projectId: null,
            total_items: 0,
            loading: true,
            pagination: { totalItems: 0, sortBy: 'created_at', descending: true },
            items: [],
            report_types: [],
            headers: [
                {
                    text: self.trans('messages.action'),
                    value: false,
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('messages.name'),
                    value: 'name',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.description'),
                    value: 'description',
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('data.report_type'),
                    value: 'report_type',
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('data.project_name'),
                    value: 'project_id',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.created_at'),
                    value: 'created_at',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.updated_at'),
                    value: 'updated_at',
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
                self.getProjectNotes();
            },
        },
    },
    created() {
        const self = this;
         self.getProjectNotes();
         self.getReportTypes();
        // self.projectId = self.$route.params.project_id;
        // self.$eventBus.$on('updateProjectNotesTable', data => {
        //     self.getProjectNotes();
        // });
    },
    beforeDestroy() {
        const self = this;
        //self.$eventBus.$off('updateProjectNotesTable');
    },
    methods: {
                getReportTypes() {
            const self = this;
            axios
                .get('/get-report-types')
                .then(function (response) {
                    self.report_types = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        getProjectNotes() {
            const self = this;

            self.loading = true;

            const { sortBy, descending, page, rowsPerPage } = self.pagination;

            axios
                .get('/reports', {
                    params: {
                        sort_by: sortBy,
                        descending: descending,
                        page: page,
                        rowsPerPage: rowsPerPage,
                        project_id: self.$route.params.project_id,
                    },
                })
                .then(function(response) {
                    self.total_items = response.data.total;
                    self.items = response.data.data;
                    self.loading = false;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },

        getType(type){
                const self = this;
                return self.report_types.find((o)=>o.key==type).value;
            
        },
        create() {
            alert(1)
            var data = { projectId: this.projectId };
           // this.$refs.noteAdd.add(data);
        },
        view(id) {
            var data = { id: id, projectId: this.projectId };
            this.$refs.noteShow.view(data);
        },
        edit(id) {
            //, projectId: this.project_id
            var data = { id: id };
            this.$refs.noteEdit.edit(data);
        },
        deleteNote(item) {
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
                        .then(function(response) {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });

                            if (response.data.success === true) {
                                self.getProjectNotes();
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
    },
};
</script>
