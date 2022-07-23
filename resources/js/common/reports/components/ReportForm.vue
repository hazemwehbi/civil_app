<template>
<div>
  <div>
                <v-container grid-list-md  id="printMe" ref="pdfHtml">
<div class="mt-5"  style="border-end: 1px solid gray;border-start: 1px solid gray;border-top: 1px solid gray">
  <div class="d-flex justify-space-between header">
    <div class="title">{{ localOffice && localOffice.office?localOffice.office.title:'' }}</div>
    <div class="logo"><img style="max-width:150px" :src="localOffice && localOffice.office && localOffice.office.media[localOffice.office.media.length-1]?localOffice.office.media[localOffice.office.media.length-1].full_url.replace('upload','public/upload'):''" /></div>
  </div>
  <div class="type_data">
    <div class="type_name">{{ language == 'ar'?localreportType.type_name_ar:localreportType.type_name_en }}</div>
    <div class="type_num">{{ localreportType.id }}</div>
  </div>
 <v-layout row wrap class="px-1">
      <v-flex xs12 sm12 md12 class="height-detect">
        <div class="label mx-2">{{trans('data.owner')}} : {{ reportData.owner }}</div>
      
    </v-flex>
       <v-flex xs12 sm12 md12 class="height-detect">
        <div class="label mx-2">{{trans('data.contractor')}} :
          <span v-for="contractor in contractors" :key="contractor.id">
                        {{ contractor.name }} 
           </span>
           </div>

      
    </v-flex>
     <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label mx-2" v-if="reportData.project">{{trans('messages.project')}} : {{ reportData.project.name }}</div>

    </v-flex>
      <v-flex xs12 sm4 md4 class="merge_rows justify-center height-detect" style="border-end: 1px solid gray;border-start: 1px solid gray;">
        <div class="label mx-2">{{trans('data.work_to_check')}} :</div>
    </v-flex>
      <v-flex xs12 sm4 md4 class="merge_rows justify-center height-detect">
        <div class="label mx-2">{{trans('data.delivery_request_num')}} :</div>
    </v-flex>
       <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label mx-2">{{trans('data.day')}} : {{day}}</div>
    
    </v-flex>
     <v-flex xs12 sm4 md4 class="height-detect merge_rows justify-center" style="border-end: 1px solid gray;border-start: 1px solid gray;">
      <v-text-field
            v-model="reportData.work_to_check"
           :rules="rulesText1"
           class="text-input"
          ></v-text-field>
    </v-flex>
     <v-flex xs12 sm4 md4 class="merge_rows justify-center height-detect">
         (<v-text-field class="text-input" :rules="rulesNumber" style="max-width:35px;margin-left: 5px!important;margin-right: 5px!important;"></v-text-field>)
    </v-flex>
    <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label mx-2">{{trans('data.date')}} : {{create_time}}</div>
    </v-flex>
    <v-flex xs12 sm4 md4 class="height-detect" style="border-end: 1px solid gray;border-start: 1px solid gray;"></v-flex>
    <v-flex xs12 sm4 md4 ></v-flex>
     <v-flex xs12 sm8 md8 class="height-detect" style="border-end: 1px solid gray; border-bottom:none">
        <div class="label mx-2 d-flex">{{trans('data.contractor_actor')}} :  <v-text-field class="text-input" :rules="rulesText1" style="max-height: 2.5rem;"></v-text-field> </div>
    </v-flex>
    <v-flex xs12 sm4 md4 class="height-detect" style="border-bottom:none">
        <div class="label d-flex">{{trans('data.signature')}} : <v-text-field class="text-input" :rules="rulesText1" style="max-height: 2.5rem;"></v-text-field> </div>
    </v-flex>
  </v-layout>

<table>

    <tr>
      <th width="5%" style="border-end:1px solid gray;" class="py-2">{{trans('data.serial')}}</th>
      <th width="40%" style="border-end:0.5px solid gray;" class="py-2">{{trans('data.list review')}}</th>
      <th width="12%" style="border-end:1px solid gray;" class="py-2">{{trans('data.equal')}}</th>
      <th width="13%" style="border-end:1px solid gray;" class="py-2">{{trans('data.not equal')}}</th>
      <th width="30%" class="last-col">{{trans('data.notes')}}</th>
    </tr>
  
<tr  v-if="language == 'ar'" row wrap v-for="(type_list, index) in localreportType.type_list_ar" :key="index+'x'">
   <td style="border-end:1px solid gray; " class="py-2"> {{ index+1 }}</td>
    <td style="border-end:0.5px solid gray; " class="py-2"> {{ type_list }}</td>
    <td style="border-end:1px solid gray;" class="py-2"> 
                    <v-switch
              color="success"
              class="my-auto mx-2"
              hide-details
            ></v-switch>
      </td>
  <td style="border-end:1px solid gray; " class="py-2"> 
               <v-switch
              color="success"
              hide-details
              class="my-auto mx-2"
            ></v-switch>
      </td>
   <td :rowspan="localreportType.type_list_ar.length" >  
        <v-textarea v-if="index==0" :rows="localreportType.type_list_ar.length" cols="8" class="mx-1"></v-textarea>
      </td>
  </tr>
<tr  v-if="language == 'en'" row wrap v-for="(type_list, index) in localreportType.type_list_en" :key="index+'x'">
   <td style="border-end:1px solid gray; " class="py-2"> {{ index+1 }}</td>
    <td style="border-end:0.5px solid gray; " class="py-2"> {{ type_list }}</td>
    <td style="border-end:1px solid gray;" class="py-2"> 
                    <v-switch
              color="success"
              class="my-auto mx-2"
              hide-details
            ></v-switch>
      </td>
  <td style="border-end:1px solid gray; " class="py-2"> 
               <v-switch
              color="success"
              hide-details
              class="my-auto mx-2"
            ></v-switch>
      </td>
   <td :rowspan="localreportType.type_list_ar.length">  
        <v-textarea v-if="index==0" :rows="localreportType.type_list_ar.length" cols="8" class="mx-1"></v-textarea>
      </td>
  </tr>
</table>
  <!--<v-layout row wrap>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;">{{trans('data.serial')}}</v-flex>
      <v-flex xs12 sm6 md6 style="border-end:1px solid gray;">{{trans('data.list review')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;">{{trans('data.equal')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;">{{trans('data.not equal')}}</v-flex>
      <v-flex xs12 sm3 md3 class="last-col">{{trans('data.notes')}}</v-flex>
      </v-layout>-->
<!--<v-layout class="list-items"  row wrap v-for="(type_list, index) in localreportType.type_list_en" :key="index" v-if="language == 'en'">
     <v-flex xs12 sm1 md1 style="border-end:1px solid gray; ">{{ index+1 }}</v-flex>
      <v-flex xs12 sm6 md6 style="border-end:1px solid gray;">{{ type_list }}</v-flex>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;">
          <v-switch
              color="success"
              hide-details
            ></v-switch>
      </v-flex>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;">
                    <v-switch
              color="success"
              hide-details
            ></v-switch>
      </v-flex>
      <v-flex xs12 sm3 md3>
        <v-textarea rows="2" cols="8"></v-textarea>
      </v-flex>
</v-layout>-->
<!--<v-layout class="list-items"  v-if="language == 'ar'" row wrap v-for="(type_list, index) in localreportType.type_list_ar" :key="index+'x'">
     <v-flex xs12 sm1 md1 style="border-end:1px solid gray; ">{{ index+1 }}</v-flex>
      <v-flex xs12 sm6 md6 style="border-end:1px solid gray;">{{ type_list }}</v-flex>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;">
                    <v-switch
              color="success"
              hide-details
            ></v-switch>
      </v-flex>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;">
               <v-switch
              color="success"
              hide-details
            ></v-switch>
      </v-flex>
      <v-flex xs12 sm3 md3 rowspan="3">
        <v-textarea rows="2" cols="8"></v-textarea>
      </v-flex>
</v-layout>-->
     
    
     <v-layout row wrap class="px-1">
      <div style="border-end:1px solid gray;border-bottom:1px solid gray;width:50%">
        <div class="px-2 py-1" style="border-bottom:1px solid gray;background:#ededed">
        {{trans('data.Rating scores')}}:
        </div>
        <div class="px-2 footer-item">
          1 {{trans('data.Acceptable')}} (
                 <v-text-field class="text-input" :rules="rulesText2" style="max-height: 2.5rem;max-width: 4rem;margin:0"></v-text-field>
          )
        </div>
            <div class="px-2 footer-item">
          2 {{trans('data.Accepted comments')}} (
            <v-text-field class="text-input" :rules="rulesText2" style="max-height: 2.5rem;max-width: 4rem;margin:0"></v-text-field>
          )
        </div>
            <div class="px-2 footer-item">
          3 {{trans('data.unacceptable')}} (
             <v-text-field class="text-input" :rules="rulesText2" style="max-height: 2.5rem;max-width: 4rem;margin:0"></v-text-field>
         )
        </div>
        </div>
      <div class="px-2" style="border-bottom:1px solid gray;width:50%">
        <div class="footer-item mt-2">{{trans('data.Supervising engineer')}}:
         <v-text-field
            style="max-height: 2.5rem;"
            class="text-input"
            :rules="rulesText1"
          ></v-text-field></div>
         <div class="footer-item mt-2">{{trans('data.signature')}}:
             <v-text-field
            style="max-height: 2.5rem;"
            class="text-input"
              :rules="rulesText1"
          ></v-text-field>
         </div>
        </div>
     </v-layout>
</div>
                </v-container>
        <v-btn
                style="background-color: #06706d; color: white"
                color="darken-1"
                class="mt-3"
                v-if="!edit"
                @click="printPdf"
                :loading="loading"
                :disabled="loading"
            >
                {{ trans('data.save') }}
            </v-btn>
</div>
	
</div>
</template>

<script>
import jsPDF from 'jspdf';
import html2canvas from "html2canvas"


export default {
  components:{
jsPDF
  },
  props:{
    reportType: null,
    project: null,
    office: null,
    report: null,
    edit: false,
  },
data(){
  return {
    reportData: {},
    create_time: null,
     day: '',
     loading: false,
     language: 'ar',
     localreportType: null,
     localOffice: null,
currentPage: 0,
			pageCount: 0,
     contractors: [],
     pdfBlob: null,
     options:[this.trans('data.yes'),this.trans('data.no')],
      rulesText1: [
           v => v.length <= 12 || 'Max 12 characters',
      ],
        rulesText2: [
           v => v.length <= 5 || 'Max 5 characters',
      ],
      rulesNumber:[
        v => v.length <= 5 || 'Max 5 characters',
        v => Number.isInteger(Number(v)) || 'The value must be an integer number',
      ]
  }
},
created(){
  const self = this;
  self.currentDateTime();
  self.getReportData();
  self.language = localStorage.getItem('currentLange')?localStorage.getItem('currentLange'):'ar'

},
watch:{
  reportType(){
    this.localreportType = this.reportType
  },
   office(){
    this.localOffice = this.office
  },
    project(){
this.getReportData();
 this.contractors = this.project?.members?.filter(val => val.user_type_log === 'CONTRACTING_COMPANY')
  }
},
methods:{

    printPdf() {
    //  const doc = new jsPDF("p", "pt", "a4", true, { compress: true });
      const Html = this.$refs.pdfHtml;
      html2canvas(Html,{
        scale: 0.99999999
      })
      .then((canvas) => {
        const imgData = canvas.toDataURL('image/png');
        const pdf = new jsPDF("","", "a4", true, { compress: true });
        
        pdf.addImage(imgData, 'PNG', 0, 0);
        this.pdfBlob = pdf.output('blob');
         this.store()
      //  window.open(pdf.output("bloburl"), "_blank")
  });
    },
      getReportData() {
         const self = this;
                     if(self.edit){
                         self.localreportType =  self.report.type
                         self.localOffice= self.report.office
                        self.reportData.project= self.report.project
                        self.contractors = self.report.project?.members?.filter(val => val.user_type_log === 'CONTRACTING_COMPANY')
                        self.reportData.owner= self.report.project.customer.name
                     }
                     else{
                        self.localreportType = self.reportType
                      self.localOffice = self.office
                     self.reportData.owner= self.project?.customer?.name
                     self.reportData.project= self.project
                     self.contractors = self.project?.members?.filter(val => val.user_type_log === 'CONTRACTING_COMPANY')
                     }
                     self.$forceUpdate();  
        },
           store() {
            const self = this;
            let formData = new FormData();
            formData.append('pdfFile', self.pdfBlob);
            formData.append('project_id', self.project.id);
            formData.append('office_id', self.office?.id);
            formData.append('type', self.reportType.id);
            self.$validator.validateAll().then((result) => {
                if (result == true) {
                    self.loading = true;
                    axios
                        .post('/reports', formData)
                        .then(function (response) {
                            self.loading = false;
                            console.log(response.data.msg);
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                            if (response.data.success === true) {
                                 self.goBack();
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
                }
            });
           
        },
    currentDateTime() {
            const current = new Date();
            const date =
                current.getFullYear() + '/' + (current.getMonth() + 1) + '/' + current.getDate();
            const time =
                current.getHours() + ':' + current.getMinutes() + ':' + current.getSeconds();
            const dateTime = date //+ ' ' + time;
            this.create_time = dateTime;
            var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
this.day = days[current.getDay()];
this.$forceUpdate();
        },
}
}
</script>

<style scoped>
.sm1, .md1,.sm6,.md6,.sm2 ,.md2{
  justify-content: center;
}
.logo{
  text-align: end;
}
.title {
  padding: 20px;
  text-align: start;
}
.header{
  border-bottom: 1px solid gray;
      align-items: center;
}
.list-items{
  text-align: center;
}
.type_data{
      display: flex;
   justify-content: center;
    border-bottom: 1px solid gray;
    background: #ededed;
    padding: 10px;
}
.type_name{
  width: 100%;
    text-align: center;
}
.footer-item{
      display: flex;
    max-height: 2.5rem;
    align-items: center;
}
.flex{
  display: flex;
  border-bottom: 1px solid gray;
}

table, th, td {
  text-align: center;
  border-top: 0.5px solid gray;
  border-bottom: 0.5px solid gray;
  border-collapse: collapse;
  min-width: 100%;
}
.height-detect{
  height: 2rem;
}
.merge_rows{
  border-bottom:none!important;
}
.label{
  max-width: fit-content;
  white-space: nowrap;
}
/*::v-deep .theme--light.v-text-field>.v-input__control>.v-input__slot:before{
  border:none!important 
}*/
.text-input{
  margin:-0.6rem 15px 0 15px;
  padding: 0;
}
  .v-text-field >>> input {
      text-align: center!important;
    }
 /*  .v-select >>> .v-input__icon {
     display: none!important; 
    }*/
</style>