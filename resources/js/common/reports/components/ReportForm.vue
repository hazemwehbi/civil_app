<template>
<div class="mx-5 px-1" style="border-left: 1px solid gray;border-right: 1px solid gray;border-top: 1px solid gray">
  <div class="d-flex justify-space-between">
    <div class="logo"></div>
    <div class="title"></div>
  </div>
  <div class="type_data">
    <div class="type_name"></div>
    <div class="type_num"></div>
  </div>
 <v-layout row wrap>
      <v-flex xs12 sm12 md12 class="height-detect">
        <div class="label mx-2">{{trans('data.name')}} :</div>
         <v-text-field
            v-model="reportData.name"
           
            
            required
          ></v-text-field>
    </v-flex>
       <v-flex xs12 sm12 md12 class="height-detect">
        <div class="label mx-2">{{trans('data.contractor')}} :</div>
         <v-text-field
            v-model="reportData.contractor"
           
            
            required
          ></v-text-field>
    </v-flex>
     <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label mx-2">{{trans('messages.project')}} :</div>
         <v-text-field
            v-model="reportData.project_id"
           
            required
          ></v-text-field>
    </v-flex>
      <v-flex xs12 sm4 md4 class="merge_rows justify-center height-detect" style="border-left: 1px solid gray;border-right: 1px solid gray;">
        <div class="label mx-2">{{trans('data.work_to_check')}} :</div>
    </v-flex>
      <v-flex xs12 sm4 md4 class="merge_rows justify-center height-detect">
        <div class="label mx-2">{{trans('data.delivery_request_num')}} :</div>
    </v-flex>
       <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label mx-2">{{trans('data.day')}} :</div>
         <v-text-field
            v-model="reportData.day"
          ></v-text-field>
    </v-flex>
     <v-flex xs12 sm4 md4 class="height-detect merge_rows justify-center" style="border-left: 1px solid gray;border-right: 1px solid gray;">
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
        <div class="label mx-2">{{trans('data.date')}} :</div>
              <flat-pickr
                                                    v-model="reportData.date"
                                                    v-validate="'required'"
                                                    name="start_date"
                                                    required
                                                    :config="flatPickerDate()"
                                                    :data-vv-as="trans('messages.start_date')"
                                                ></flat-pickr>
    </v-flex>
    <v-flex xs12 sm4 md4 class="height-detect" style="border-left: 1px solid gray;border-right: 1px solid gray;"></v-flex>
    <v-flex xs12 sm4 md4 ></v-flex>
     <v-flex xs12 sm8 md8 class="height-detect" style="border-left: 1px solid gray;">
        <div class="label mx-2">{{trans('data.contractor_actor')}} :</div>
    </v-flex>
    <v-flex xs12 sm4 md4 class="height-detect">
        <div class="label">{{trans('data.signature')}} :</div>
    </v-flex>
  </v-layout>
  <v-layout row wrap>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;">{{trans('data.serial')}}</v-flex>
      <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.list review')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;">{{trans('data.equal')}}</v-flex>
      <v-flex xs12 sm2 md2 style="border-left:1px solid gray;">{{trans('data.not equal')}}</v-flex>
      <v-flex xs12 sm2 md2 class="last-col">{{trans('data.notes')}}</v-flex>
      </v-layout>
<v-layout row wrap v-for="(type_list, index) in reportType.type_list_ar" :key="index">
     <v-flex xs12 sm1 md1 style="border-left:1px solid gray; ">{{ index+1 }}</v-flex>
      <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{ type_list }}</v-flex>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>
</v-layout>
      <!--  <v-flex xs12 sm1 md1 style="border-left:1px solid gray;">2</v-flex>
      <v-flex xs12 sm6 md6 style="border-left:1px solid gray;" v-if="false">{{trans('data.Review the coordinates of the excavation boundaries with the boundaries of the building')}}</v-flex>
     <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Ensure the thickness of the replacement layer according to the recommendations of the consultant')}}</v-flex>
     <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.A string is pulled to make sure the pigs ribs are straight')}}</v-flex>
     <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Raising the corners of the hygiene layer using the Total Station device, if available, and matching them with the drawings')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>
              <v-flex xs12 sm1 md1 style="border-left:1px solid gray; ">3</v-flex>
      <v-flex xs12 sm6 md6 style="border-left:1px solid gray;" v-if="false">{{trans('data.Check the foundation level with the plates and with the nearest ruber and the depth of excavation from the soil report')}}</v-flex>
      <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.To ensure that the compaction method used is in accordance with the recommendations of the consultant')}}</v-flex>
      <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Ensure that all ribs are strengthened with staples or bars in the event that the pig is at a height higher than the natural ground')}}</v-flex>
      <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Matching the structural axes with the workshop drawings on the pig and the correctness of the signature of its angles with each other')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>
      
              <v-flex xs12 sm1 md1 style="border-left:1px solid gray;">4</v-flex>
      <v-flex xs12 sm6 md6 style="border-left:1px solid gray;" v-if="false">{{trans('data.Review the clearance of the bottom and sides of the drilling and the levelness of the drilling')}}</v-flex>
       <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Ensure that the weight used in the compaction is in accordance with the consultants instructions')}}</v-flex>
       <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Check the horizontality of each rib of the pig with a water balance')}}</v-flex>
       <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Reviewing the dimensions of hygiene of the rules and the limits of their sides in relation to the axes')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>
      
              <v-flex xs12 sm1 md1 style="border-left:1px solid gray;">5</v-flex>
      <v-flex xs12 sm6 md6 style="border-left:1px solid gray;" v-if="false">{{trans('data.Ensure that the type of soil of the bottom of the excavation does not have observations that differ from the soil report')}}</v-flex>
       <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Confirm the result of the blood test before starting the next layer')}}</v-flex>
       <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Reviewing the horizontality of the pork ribs at the meeting points')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>

                <v-flex xs12 sm1 md1 style="border-left:1px solid gray;">6</v-flex>
       <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Ensure that the substitution layer matches the approved sample')}}</v-flex>
       <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Verify the angles between the sides by the Pythagorean theorem')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>
      
                     <v-flex xs12 sm1 md1 style="border-left:1px solid gray;">7</v-flex>
       <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Make sure that there is no movement in the corners of the meeting between the ribs of the pig to be well strengthened')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>

                     <v-flex xs12 sm1 md1 style="border-left:1px solid gray;">8</v-flex>
      
       <v-flex xs12 sm6 md6 style="border-left:1px solid gray;">{{trans('data.Axes review on the pig')}}</v-flex>
      <v-flex xs12 sm1 md1 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 style="border-left:1px solid gray;"></v-flex>
      <v-flex xs12 sm2 md2 class="last-col" style=""></v-flex>
    </v-layout>-->
    
     <v-layout row wrap>
      <div style="border-left:1px solid gray;border-bottom:1px solid gray;width:50%">
        <div class="px-2" style="border-bottom:1px solid gray;background:lightgray">
        {{trans('data.Rating scores')}}:
        </div>
        <div class="px-2 footer-item">
          1 {{trans('data.Acceptable')}} (
           <!-- <v-text-field
            v-model="customer"
            style="max-width:15px;max-height: 2.5rem;"
            :rules="nameRules"
            
            required
          ></v-text-field>-->
          )
        </div>
            <div class="px-2 footer-item">
          2 {{trans('data.Accepted comments')}} (
              <!--  <v-text-field
            v-model="customer"
            style="max-width:15px;max-height: 2.5rem;"
          ></v-text-field>-->
          )
        </div>
            <div class="px-2 footer-item">
          3 {{trans('data.unacceptable')}} (
               <!-- <v-text-field
            v-model="customer"
            style="max-width:15px;max-height: 2.5rem;"
            
          ></v-text-field>-->
          )
        </div>
        </div>
      <div class="px-2" style="border-left:1px solid gray;border-bottom:1px solid gray;width:50%">
        <div class="footer-item">{{trans('data.Supervising engineer')}}:
         <!-- <v-text-field
            v-model="customer"
            style="max-height: 2.5rem;"
          ></v-text-field>--></div>
         <div class="footer-item">{{trans('data.signature')}}:
            <!-- <v-text-field
            v-model="customer"
            style="max-height: 2.5rem;"
          ></v-text-field>-->
         </div>
        </div>
     </v-layout>
</div>
</template>

<script>
export default {
  props:{
    reportType: null
  },
data(){
  return {
    reportData:[]
  }
}
}
</script>

<style scoped>
.sm1, .md1,.sm6,.md6,.sm2 ,.md2{
  justify-content: center;
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