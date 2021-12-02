<template>
    <v-container grid-list-md>
            <v-layout row pt-3>
                <v-flex xs12 sm12>
                    <v-card class="elevation-3">
                        <v-card-title primary-title xs8 sm8>
                            <div>
                                <div class="headline">
                                    {{ trans('data.review_project_data') }}
                                </div>
                            </div>
                        </v-card-title>
                        <v-divider></v-divider>
                        <v-card-text>
  
                            <v-container grid-list-md>
                                <v-layout row wrap>
                                    <v-flex md3>
                                        <v-text-field
                                        v-model="project.buiding_type"
                                        :label="trans('data.buiding_type')"
                                    ></v-text-field>
                                      </v-flex> 
                                     <v-flex md3>
                                        <v-text-field
                                        v-model="project.unit_number"
                                        :label="trans('data.unit_number')"
                                    ></v-text-field>
                                     </v-flex> 
                                        <v-flex md3>
                                    <v-text-field
                                        v-model="project.build_rate"
                                        :label="trans('data.build_rate')"
                                    ></v-text-field>

                                      </v-flex> 
                                       <v-flex md3>
                                    <v-text-field
                                        v-model="project.role_number"
                                        :label="trans('data.role_number')"
                                    ></v-text-field>
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
export default {
    props:['projectId'],
    data(){
        return{
            project:{

                buiding_type:'',
                role_number:'',
                unit_number:'',
                build_rate:''
                // name:'',
                // authorization_request_number:'',
                // license_number:'',
                // plot_number:'',
                // cadastral_decision_number:'',
                // start_date:'',
                // end_date:'',
                // status:'',
                // description:'',
                // billing_type:'',
                // estimated_hours:'',
                // estimated_cost:'',
                // task_hours:'',
            },
        }; 
    },
    created(){
        const self = this;
        self.getProjectData();
    },
    methods:{
        getProjectData(){
            const self = this;
            axios.post('/project-info' ,{project_id:self.projectId}).then(function(response) {
                self.project=response.data;
                console.log(self.customer);
            })
            .catch(function(error) {
                console.log(error);
            });
        },
        

        nextStep() {
            this.$emit('next',this.project);
        },


    }
}
</script>