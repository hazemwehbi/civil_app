<template>
    <v-container grid-list-md>
        <v-layout row>
            <v-flex xs12 sm12>
                <v-card class="elevation-3">
                    <v-card-title primary-title xs8 sm8>
                        <div>
                            <div class="headline">
                                {{ trans('data.document_info') }}
                            </div>
                        </div>
                    </v-card-title>
                    <v-divider></v-divider>
                    <v-card-text>
                        <v-container grid-list-md>
                            <v-form ref="form" v-if="isEdit">
                                <v-layout row wrap>
                                    <v-flex xs12 md12 v-show="can_file_upload">
                                        <h3>
                                            <v-icon small>attachment</v-icon>
                                            {{ trans('messages.file_upload') }}
                                        </h3>
                                        <v-flex xs12 md12>
                                            <div class="dropzone" id="fileupload"></div>
                                        </v-flex>
                                    </v-flex>

                                    <v-btn
                                        color="blue lighten-1 white--text"
                                        @click="toggleUploadDocumenet"
                                    >
                                        {{ trans('messages.upload_doc') }}
                                    </v-btn>
                                </v-layout>
                            </v-form>
                            <v-layout row wrap >
                                <v-flex md3  v-for="media in tempMedia" :key="media.id">
                                    <div>
                                        <div>
                                            <img :src="media.full_url" width="200px" />
                                        </div>
                                        <div>
                                            <span>
                                                <a :href="media.download_url">
                                                    {{ media.display_name }}
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-card-text>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
</template>
<script>
import Dropzone from 'dropzone';
Dropzone.autoDiscover = false;

export default {
    components: {
        Dropzone,
    },
    props: ['customerId'],
    data() {
        return {
            isEdit: true,
            medias: [],
            tempMedia: [],
            dropzone: null,
            can_file_upload: false,
        };
    },
    created() {
        const self = this;
    },
    mounted() {
        const self = this;
    },
    methods: {
        toggleUploadDocumenet() {
            const self = this;
            self.initDropzone();

            self.can_file_upload = !self.can_file_upload;
        },
        nextStep() {
            const self = this;
            var data = {};
            this.$emit('next', self.medias);
        },
        initDropzone() {
            const self = this;
            if (self.dropzone) {
                self.dropzone.destroy();
            }
            self.dropzone = new Dropzone('div#fileupload', {
                url: APP.APP_URL + '/media',
                paramName: 'file',
                maxFilesize: APP.UPLOAD_FILE_MAX_SIZE,
                addRemoveLinks: false,
                removedfile: function (file) {
                    var fileName = file.name;
                    var index = dz_uploaded_url
                        .map(function (d, index) {
                            if (d == file) return index;
                        })
                        .filter(isFinite)[0];
                    console.log(file);
                    $.ajax({
                        type: 'POST',
                        url: 'removeFile',
                        data: { name: fileName, request: 'remove' },
                        sucess: function (data) {
                            console.log('success: ' + data);
                        },
                    });
                    var _ref;
                    return (_ref = file.previewElement) != null
                        ? _ref.parentNode.removeChild(file.previewElement)
                        : void 0;
                },
                dictDefaultMessage: self.trans('messages.drop_document_here'),
                uploadMultiple: true,
                headers: { 'X-CSRF-TOKEN': _token },
                autoProcessQueue: true,
                success: function (file, response) {
                    if (response.success == true) {
                        self.medias.push(response.file_name);

                        console.log(self.medias);
                    }
                },
            });
        },
        fillEditData(data, isEdit) {
            const self = this;
            (self.tempMedia = data), (self.isEdit = isEdit);
        },
    },
};
</script>