<template>
    <div class="component-wrap">
        <v-container grid-list-md>
        <v-stepper v-model="e1" alt-labels>
            <v-stepper-header>
            <v-stepper-step :complete="e1 > 1" step="1" color="teal">
                {{ trans('data.customer_info') }}
                
            </v-stepper-step>

            <v-divider></v-divider>

            <v-stepper-step step="2" :complete="e1 > 2" color="teal">
       
               {{ trans('data.location_info') }}
            </v-stepper-step>

            <v-divider></v-divider>

            <v-stepper-step step="3" :complete="e1 > 3" color="teal">
            
                 {{ trans('data.project_info') }}
            </v-stepper-step>
            
            </v-stepper-header>

        <v-stepper-items>
            <v-stepper-content step="1">
                <CustomerInfo  @next="getCustomerData($event)" ref="customerInfo"  @click="getCustomerInfo"/>
                 <v-layout row >
                              <v-btn color="teal" small outline @click="$router.go(-1)" >
                                {{ trans('messages.back') }}
                            </v-btn> 
                    <div style="display: flex;" align="right">
                            <v-btn style="background-color:#06706d;color:white;" small @click="getCustomerInfo">
                                    {{ trans('messages.next') }}
                            </v-btn>
               
                        </div> 
                </v-layout> 
            </v-stepper-content>

      <v-stepper-content step="2">
          <LocationInfo  @next="getLocationData($event)"  ref="locationInfo" />
        <v-layout row pt-3>
                <v-btn color="teal" small outline @click="e1 = 1" >
                    {{ trans('messages.back') }}
                </v-btn> 
            <div style="display: flex;" align="right">
                <v-btn style="background-color:#06706d;color:white;" small @click="e1 = 3">
                    {{ trans('messages.next') }}
                </v-btn>
        
            </div> 
        </v-layout> 
    </v-stepper-content>

      <v-stepper-content step="3">
        <ProjectInfo  @next="getProjectData($event)"  ref="projectInfo"/>
        <v-layout row pt-3>
                  <v-btn color="teal" small outline @click="e1 = 2" >
                    {{ trans('messages.back') }}
                </v-btn> 
            <div style="display: flex;" align="right">
                <v-btn style="background-color:#06706d;color:white;" small @click="getProjectInfo">
                    {{ trans('messages.save') }}
                </v-btn>
      
            </div> 
        </v-layout> 
      </v-stepper-content>


    </v-stepper-items>
  </v-stepper>

        
        </v-container>          
        </div>
</template>

<script>
import CustomerInfo from "./project_info/customerInfo.vue";
import LocationInfo from "./project_info/locationInfo.vue";
import ProjectInfo from "./project_info/ProjectInfo.vue";

export default {
    components:{
        CustomerInfo,
        LocationInfo,
        ProjectInfo,
        
    },
    data(){
        const self = this;
        return{
            e1: 1,
            project_id:'',
            customer:new Object,
            location   :new Object,
            project:new Object,
        }        
    },
    mounted() {
       
    },


    created(){
        const self = this;
       // self.customer_id=self.$route.params.project.customer_id;
       // self.project_id=self.$route.params.project.project_id;
    },
    methods: {

           

         goTo(step, can,data) {
             alert(JSON.stringify(data))
    //   if (can) {
    //     this.e1 = step;
    //   }
    },
    getCustomerData(data){
        this.customer=data;
          this.e1=2;

    },
    getLocationData(data){
         this.location=data;
         this.e1=3;
    },
     getProjectData(data){
       this.project=data;
       this.store();
    },
    getCustomerInfo(){
         this.$refs.customerInfo.nextStep();
       
    },
    getLocationInfo(){
         this.$refs.locationInfo.nextStep();
         
    },
   getProjectInfo(){
         this.$refs.projectInfo.nextStep();
    },
    click(){
      //  this.$refs.customerInfo.nextStep();
      //  this.$refs.locationInfo.nextStep();
      //  this.$refs.projectInfo.nextStep();
    },

        store() {
                   alert(JSON.stringify(this.customer))
            // const self = this;
            // let data = {
            //     name: self.project.name,
            //     category_id: self.category_id,
            //     customer_id: self.project.customer_id,
            //     billing_type: self.project.billing_type,
            //     total_rate: self.project.total_rate,
            //     price_per_hours: self.project.price_per_hours,
            //     estimated_hours: self.project.estimated_hours,
            //     estimated_cost: self.project.estimated_cost,
            //     status: self.project.status,
            //     lead_id: self.project.lead_id,
            //     description: self.project.description,
            //     user_id: self.project.user_id,
            //     start_date: self.start_date,
            //     end_date: self.end_date,
            // };
            // self.$validator.validateAll().then(result => {
            //     if (result == true) {
            //         self.loading = true;
            //         axios
            //             .post('/projects', data)
            //             .then(function(response) {
            //                 self.loading = false;
            //                 self.$store.commit('showSnackbar', {
            //                     message: response.data.msg,
            //                     color: response.data.success,
            //                 });
            //                 if (response.data.success === true) {
            //                     self.$eventBus.$emit('updateProjectTable');
            //                 }
            //             })
            //             .catch(function(error) {
            //                 console.log(error);
            //             });
            //     }
            // });
        },
    },
};
</script>
 

