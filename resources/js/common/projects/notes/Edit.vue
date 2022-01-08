<template>
    <v-layout row justify-center>
        <v-dialog v-model="dialog" max-width="900px">
            <!-- v-card -->
            <v-card>
                <v-card-title>
                    <v-icon medium>note_add</v-icon>
                    <span class="headline">
                        {{ trans('messages.edit') }}
                    </span>
                    <v-spacer></v-spacer>
                    <v-btn flat icon @click="dialog = false">
                        <v-icon>clear</v-icon>
                    </v-btn>
                </v-card-title>
                <v-divider></v-divider>
                <v-card-text>
                    <v-container grid-list-md>
                        <v-layout row wrap>
                            <v-flex xs12 sm12 md12>
                                <v-text-field
                                    v-model="report.name"
                                    :label="trans('messages.name')"
                                    v-validate="'required'"
                                    data-vv-name="report.name"
                                    :data-vv-as="trans('messages.name')"
                                    :error-messages="errors.collect('note.name')"
                                    required
                                ></v-text-field>
                            </v-flex>

                            <v-flex xs12 sm12 md12>
                                <quill-editor v-model="report.description"> </quill-editor>
                            </v-flex>

                            <!-- <v-flex xs12 md12>
                                <div class="dropzone" id="fileUploadEdit"></div>
                            </v-flex> -->
                        </v-layout>
                    </v-container>
                </v-card-text>
                <v-divider></v-divider>
                   <v-layout justify-center>
                <v-card-actions>
                    <v-btn color="teal" small outline @click="dialog = false">
                        {{ trans('data.close') }}
                    </v-btn>

                    <v-btn style="background-color:#06706d;color:white;" small @click="update" :loading="loading" :disabled="loading">
                        {{ trans('data.update') }}
                    </v-btn>
                </v-card-actions>
                  </v-layout>
            </v-card>
            <!-- /v-card -->
        </v-dialog>
    </v-layout>
</template>

<script>
export default {
    data() {
        const self = this;
        return {
            dialog: false,
            report: {},
           // dropzone: null,
           // project_id: '',//self.$route.params.project_id,
            loading: false,
        };
    },
    methods: {
        edit(data) {
            const self = this;
           // self.projectId = data.project_id;
            axios
                .get('/reports/' + data.id, {
                   // params: { project_id: data.project_id },
                })
                .then(function(response) {
                    self.report = response.data;
                    //self.note.medias = [];
                   // self.initDropzone();
                    self.dialog = true;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },

          update() {
            const self = this;
            let data = _.pick(self.report, ['name', 'description']);
            self.$validator.validateAll().then(result => {
                if (result == true) {
                    self.loading = true;
                    axios
                        .put('/reports/' + self.report.id, data)
                        .then(function(response) {
                            self.loading = false;
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });

                            if (response.data.success === true) {
                                self.dialog = false;
                                self.$emit('updateReportTable', data);
                              //  this.$emit('updateReportTable');
                            }
                        })
                        .catch(function(error) {
                            console.log(error);
                        });
                }
            });
        },
        // initDropzone() {
        //     if (this.dropzone) {
        //         this.dropzone.destroy();
        //     }

        //     const self = this;
        //     self.dropzone = new Dropzone('div#fileUploadEdit', {
        //         url: APP.APP_URL + '/media',
        //         paramName: 'file',
        //         maxFilesize: APP.UPLOAD_FILE_MAX_SIZE,
        //         uploadMultiple: true,
        //         headers: { 'X-CSRF-TOKEN': _token },
        //         dictDefaultMessage: self.trans('messages.drop_document_here'),
        //         autoProcessQueue: true,
        //         success: function(file, response) {
        //             if (response.success == true) {
        //                 self.note.medias.push(response.file_name);
        //             }
        //         },
        //     });
        // },
      
    },
};
</script>
