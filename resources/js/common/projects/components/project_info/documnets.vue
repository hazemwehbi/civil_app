<template>
<div>
    <div class="flex flex-wrap rounded-md shadow-sm" role="group" v-if="!isEdit">
  <button @click="getMedia('images')" type="button" class="inline-flex items-center py-2 px-4 text-sm font-medium text-gray-900 bg-white rounded-l-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-blue-500 dark:focus:text-white">
             <svg lass="mx-auto feather feather-image text-slate-400" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
    <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
    <circle cx="8.5" cy="8.5" r="1.5"></circle>
    <polyline points="21 15 16 10 5 21"></polyline>
  </svg>
    {{trans('data.project images')}}
  </button>
  <button @click="getMedia('files')" type="button" class="inline-flex items-center py-2 px-4 text-sm font-medium text-gray-900 bg-white border-t border-b border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-blue-500 dark:focus:text-white">
    <svg aria-hidden="true" class="mr-2 w-4 h-4 fill-current" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M5 4a1 1 0 00-2 0v7.268a2 2 0 000 3.464V16a1 1 0 102 0v-1.268a2 2 0 000-3.464V4zM11 4a1 1 0 10-2 0v1.268a2 2 0 000 3.464V16a1 1 0 102 0V8.732a2 2 0 000-3.464V4zM16 3a1 1 0 011 1v7.268a2 2 0 010 3.464V16a1 1 0 11-2 0v-1.268a2 2 0 010-3.464V4a1 1 0 011-1z"></path></svg>
    {{trans('data.project files')}}
  </button>
  <button @click="getMedia('videos')" type="button" class="inline-flex items-center py-2 px-4 text-sm font-medium text-gray-900 bg-white rounded-r-md border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-blue-500 dark:focus:text-white">
    <svg aria-hidden="true" class="mr-2 w-4 h-4 fill-current" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M2 9.5A3.5 3.5 0 005.5 13H9v2.586l-1.293-1.293a1 1 0 00-1.414 1.414l3 3a1 1 0 001.414 0l3-3a1 1 0 00-1.414-1.414L11 15.586V13h2.5a4.5 4.5 0 10-.616-8.958 4.002 4.002 0 10-7.753 1.977A3.5 3.5 0 002 9.5zm9 3.5H9V8a1 1 0 012 0v5z" clip-rule="evenodd"></path></svg>
    {{trans('data.project videos')}}
  </button>
</div>
    <v-container grid-list-md class="flex">
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
                                            <!--<div class="dropzone" id="fileupload"></div>-->
                                            <vue-dropzone @vdropzone-success="vsuccessMuliple" class="w-full" ref="myVueDropzone" id="dropzone" :options="dropzoneOptions"></vue-dropzone>
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
                            <div class="flex">
                                 <div class="main_view" :class="$vuetify.breakpoint.xsOnly?'w-full':'w-3/4'" v-if="type === 'image'">
            <img v-if="currentSrc" :src="currentSrc" id="main" alt="IMAGE">
            <img v-else src="img/image-1@2x.jpg" style="max-width:40rem">
        </div>
 
        <!-- All images with side view -->
        <div class="side_view max-h-80 overflow-y-auto" v-if="type === 'image'">
            <img  v-for="(media,index) in filterMedia" :key="media.id" :src="media.full_url" @click="currentSrc = media.full_url">
        </div>
          <div class="main_view overflow-y-auto max-h-full" :class="$vuetify.breakpoint.xsOnly?'w-full':'w-3/4'" v-if="type === 'file'">
 <button v-if="numPages>0" type="button" class="text-blue-700 hover:text-white border-solid border-2 border-blue-500 hover:bg-blue-600 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center mr-2 mb-2 dark:border-blue-500 dark:text-blue-500 dark:hover:text-white dark:hover:bg-blue-600 dark:focus:ring-blue-800" @click="myPdfComponentPrint.print()">print</button>
		<pdf
			v-for="i in numPages"
			:key="i"
			:src="currentSrc"
			:page="i"
			style=""
		></pdf>
<img v-if="!numPages" src="img/image-1@2x.jpg" style="max-width:40rem">
        </div>
 
        <!-- All images with side view -->
        <div class="side_view max-h-80 overflow-y-auto w-1/4" v-if="type === 'file'">
            <div class="bg-slate-400" 
             v-for="(media,index) in filterMedia"
              :key="media.id" 
               @click="changePdf(media.full_url,$refs.myPdfComponent[index])">
            	<pdf
        class="mx-auto"
      ref="myPdfComponent"
       :src="media.full_url" 
		>
       <v-progress-circular
      :size="15"
      color="primary"
      indeterminate
    ></v-progress-circular>
        </pdf>
            </div>
        </div>
          <div class="main_view" :class="$vuetify.breakpoint.xsOnly?'w-full':'w-3/4'" v-if="type === 'video'">
            <div
         @click.outside="videoOpen = false"
         class="max-w-[550px] w-full mx-auto bg-white"
         >
         <iframe
         v-if="currentSrc"
            class="w-full h-[320px]"
            :src="currentSrc"
            >
         </iframe>
         <img v-if="!currentSrc" src="img/image-1@2x.jpg" >
      </div>
        </div>
 
        <!-- All images with side view -->
        <div class="side_view max-h-80 overflow-y-auto" v-if="type === 'video'">
               <div
                    v-for="media in filterMedia"
             :key="media.id"
             >
                  <img
                   @click="currentSrc = media.full_url"
                     src="https://api.tailgrids.com/images/tag/069d8cd8-ca1b-4570-9d4a-1cff18ee2a8d.svg"
                     alt="image"
                     class="w-full h-full object-center object-cover"
                     />
               </div>
                             
        </div></div>
                        </v-container>
                    </v-card-text>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
    </div>
</template>
<script>
import Dropzone from 'dropzone';
import vue2Dropzone from 'vue2-dropzone'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'

Dropzone.autoDiscover = false;
import pdf from 'vue-pdf'
export default {
    components: {
        Dropzone,
        pdf,
        vueDropzone: vue2Dropzone
    },
    props: ['customerId','media'],
    data() {
        return {
            numPages: undefined,
            isEdit: true,
            medias: [],
            tempMedia: [], 
            filterMedia: [],
            dropzone: null,
            can_file_upload: false,
            type: null,
            currentSrc:null,
            myPdfComponentPrint:null,
             dropzoneOptions: {
          url: APP.APP_URL + '/media',
          thumbnailWidth: 150,
          maxFilesize: 10,
          headers: { 'X-CSRF-TOKEN': _token }
      }
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
         //   self.initDropzone();

            self.can_file_upload = !self.can_file_upload;
        },
        getMedia(type){
            this.currentSrc = null
           this.filterMedia = this.tempMedia
           
           if(type === 'images'){
             this.filterMedia = this.tempMedia.filter(val => val? /\.(jpe?g|png|gif)$/i.test( val.full_url):'')
             this.type = 'image'
           }
                    if(type === 'files'){
             this.filterMedia = this.tempMedia.filter(val => val?/\.(pdf|docx)$/i.test( val.full_url ):'')
             this.type = 'file'
                    }
                    if(type === 'videos'){
             this.filterMedia = this.tempMedia.filter(val => val?/\.(mp4|wav)$/i.test( val.full_url):'')
             this.type = 'video'
                    }
        },
        nextStep() {
            const self = this;
            console.log(self.medias)
            this.$emit('next', self.medias);
        },
          vsuccessMuliple(files, response){
            console.log(this.medias,response,files)
    response.files_name.forEach(val => this.medias.push(val));
                        
                         this.$emit('next', this.medias);
        },
       /* initDropzone() {
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
                        response.files_name.forEach(val => self.medias.push(val));
                        console.log(self.medias,response,response.files_name)
                         self.$emit('next', self.medias);
                    }
                },
            });
        },*/
        fillEditData(data, isEdit) {
            const self = this;
            (self.tempMedia = data), (self.isEdit = isEdit);
        },
        changePdf (src,refCom){
          this.currentSrc = pdf.createLoadingTask(src)
           this.currentSrc.promise.then(pdf => {
            this.myPdfComponentPrint = refCom
			this.numPages = pdf.numPages;
            this.$forceUpdate()
		});
       
    },
    }
}
</script>
<style scoped>
   .main_view{
        height: 25rem;
    }
    .main_view img{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .side_view{
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
    }
    .side_view img{
        width: 9rem;
        height: 7rem;
        object-fit: cover;
        cursor: pointer;
        margin:0.5rem;
    }
</style>