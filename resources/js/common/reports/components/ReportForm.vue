<template>
<div>
    <v-card-text id="printMe">
                <v-container grid-list-md>
<div class="mx-5 px-1"  style="border-end: 1px solid gray;border-start: 1px solid gray;border-top: 1px solid gray">
  <div class="d-flex justify-space-between header layout">
    <div class="logo"></div>
    <div class="title">{{ reportData.owner }}</div>
  </div>
  <div class="type_data layout">
    <div class="type_name">{{ reportType.type_name }}</div>
    <div class="type_num">{{ reportType.id }}</div>
  </div>
 <v-layout row wrap>
      <v-flex xs12 sm12 md12 class="height-detect">
        <div class="label mx-2">{{trans('data.name')}} : {{ reportData.owner }}</div>
         <!--<v-text-field
            v-model="reportData.name"
            required
          ></v-text-field>-->
    </v-flex>
       <v-flex xs12 sm12 md12 class="height-detect">
        <div class="label mx-2">{{trans('data.contractor')}} : </div>

         <!--<v-text-field
            v-model="reportData.contractor"
            required
          ></v-text-field>-->
    </v-flex>
     <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label mx-2">{{trans('messages.project')}} : {{ reportData.project }}</div>
         <!--<v-text-field
            v-model="reportData.project_id"
           
            required
          ></v-text-field>-->
    </v-flex>
      <v-flex xs12 sm4 md4 class="merge_rows justify-center height-detect" style="border-end: 1px solid gray;border-start: 1px solid gray;">
        <div class="label mx-2">{{trans('data.work_to_check')}} :</div>
    </v-flex>
      <v-flex xs12 sm4 md4 class="merge_rows justify-center height-detect">
        <div class="label mx-2">{{trans('data.delivery_request_num')}} :</div>
    </v-flex>
       <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label mx-2">{{trans('data.day')}} : {{day}}</div>
         <!--<v-text-field
            v-model="reportData.day"
          ></v-text-field>-->
    </v-flex>
     <v-flex xs12 sm4 md4 class="height-detect merge_rows justify-center" style="border-end: 1px solid gray;border-start: 1px solid gray;">
      <v-text-field
            v-model="reportData.work_to_check"
          ></v-text-field>
    </v-flex>
     <v-flex xs12 sm4 md4 class="merge_rows justify-center height-detect">
         (<v-text-field
            v-model="reportData.delivery_request_num"
            style="max-width:25px"
          ></v-text-field>)
    </v-flex>
    <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label mx-2">{{trans('data.date')}} : {{create_time}}</div>
            <!--  <flat-pickr
                                                    v-model="reportData.date"
                                                    v-validate="'required'"
                                                    name="start_date"
                                                    required
                                                    :config="flatPickerDate()"
                                                    :data-vv-as="trans('messages.start_date')"
                                                ></flat-pickr>-->
    </v-flex>
    <v-flex xs12 sm4 md4 class="height-detect" style="border-end: 1px solid gray;border-start: 1px solid gray;"></v-flex>
    <v-flex xs12 sm4 md4 ></v-flex>
     <v-flex xs12 sm8 md8 class="height-detect" style="border-end: 1px solid gray;">
        <div class="label mx-2">{{trans('data.contractor_actor')}} :</div>
    </v-flex>
    <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label">{{trans('data.signature')}} :</div>
    </v-flex>
  </v-layout>
  <v-layout row wrap>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;">{{trans('data.serial')}}</v-flex>
      <v-flex xs12 sm6 md6 style="border-end:1px solid gray;">{{trans('data.list review')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;">{{trans('data.equal')}}</v-flex>
      <v-flex xs12 sm2 md2 style="border-end:1px solid gray;">{{trans('data.not equal')}}</v-flex>
      <v-flex xs12 sm2 md2 class="last-col">{{trans('data.notes')}}</v-flex>
      </v-layout>
<v-layout class="list-items"  row wrap v-for="(type_list, index) in reportType.type_list_en" :key="index" v-if="language == 'en'">
     <v-flex xs12 sm1 md1 style="border-end:1px solid gray; ">{{ index+1 }}</v-flex>
      <v-flex xs12 sm6 md6 style="border-end:1px solid gray;">{{ type_list }}</v-flex>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-end:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>
</v-layout>
<v-layout class="list-items"  v-if="language == 'ar'" row wrap v-for="(type_list, index) in reportType.type_list_ar" :key="index+'x'">
     <v-flex xs12 sm1 md1 style="border-end:1px solid gray; ">{{ index+1 }}</v-flex>
      <v-flex xs12 sm6 md6 style="border-end:1px solid gray;">{{ type_list }}</v-flex>
      <v-flex xs12 sm1 md1 style="border-end:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-end:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>
</v-layout>
     
    
     <v-layout row wrap>
      <div style="border-end:1px solid gray;border-bottom:1px solid gray;width:50%">
        <div class="px-2 py-1" style="border-bottom:1px solid gray;background:#ededed">
        {{trans('data.Rating scores')}}:
        </div>
        <div class="px-2 footer-item">
          1 {{trans('data.Acceptable')}} (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <!-- <v-text-field
            v-model="customer"
            style="max-width:15px;max-height: 2.5rem;"
            :rules="nameRules"
            
            required
          ></v-text-field>-->
          )
        </div>
            <div class="px-2 footer-item">
          2 {{trans('data.Accepted comments')}} (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <!--  <v-text-field
            v-model="customer"
            style="max-width:15px;max-height: 2.5rem;"
          ></v-text-field>-->
          )
        </div>
            <div class="px-2 footer-item">
          3 {{trans('data.unacceptable')}} (&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <!-- <v-text-field
            v-model="customer"
            style="max-width:15px;max-height: 2.5rem;"
            
          ></v-text-field>-->
          )
        </div>
        </div>
      <div class="px-2" style="border-bottom:1px solid gray;width:50%">
        <div class="footer-item mt-2">{{trans('data.Supervising engineer')}}:
         <!-- <v-text-field
            v-model="customer"
            style="max-height: 2.5rem;"
          ></v-text-field>--></div>
         <div class="footer-item mt-2">{{trans('data.signature')}}:
            <!-- <v-text-field
            v-model="customer"
            style="max-height: 2.5rem;"
          ></v-text-field>-->
         </div>
        </div>
     </v-layout>
</div>
                </v-container>
    </v-card-text>
        <v-btn
                style="background-color: #06706d; color: white"
                color="darken-1"
                class="mt-3"
                @click="store"
                :loading="loading"
                :disabled="loading"
            >
                {{ trans('data.save') }}
            </v-btn>
</div>
</template>

<script>
import { isThisISOWeek } from 'date-fns';
export default {
  props:{
    reportType: null,
    project_id: null,
   
  },
data(){
  return {
    reportData: {},
    create_time: null,
     project: {},
     day: '',
     loading: false,
     language: 'ar'
  }
},
created(){
  const self = this;
  self.currentDateTime();
   self.getProject(5);
  console.log(localStorage.getItem('currentLange'))
   //if (isLocalStorage())
  self.language = localStorage.getItem('currentLange')
},
methods:{

      getProject(project_id) {
         const self = this;
            axios
                .get('/get-project/'+ project_id)
                .then(function (response) {
                    self.project  = response.data;
                    self.reportData.owner= self.project.customer.name
                     self.reportData.project= self.project.name
                     self.$forceUpdate();
                     
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
           store() {
            const self = this;
            
            let data = {
                project_id: self.project.id,
                office_id:self.project.customer.id,
                type: this.reportType.id,
            };
            self.$validator.validateAll().then((result) => {
                if (result == true) {
                    self.loading = true;
                    axios
                        .post('/reports', data)
                        .then(function (response) {
                            self.loading = false;
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                            if (response.data.success === true) {
                                // self.goBack();
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
                }
            });
            //self.reset();
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
.title {
  padding: 20px;
}
.header{
  border-bottom: 1px solid gray;
}
.list-items{
  text-align: center;
}
.type_data{
      display: flex;
   
    border-bottom: 1px solid gray;
    background: #ededed;
    padding: 10px;
}
.type_num,.type_name{
  width: 50%;
    text-align: end;
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
::v-deep .theme--light.v-text-field>.v-input__control>.v-input__slot:before{
  border:none!important
}
.v-text-field{
  margin:-0.3rem 15px 15px 0!important;
  padding: 0;
}
</style>