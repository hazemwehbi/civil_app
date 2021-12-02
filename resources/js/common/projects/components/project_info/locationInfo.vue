<template>
    <v-container grid-list-md>
            <v-layout row >
                <v-flex xs12 sm12>
                    <v-card class="elevation-3">
                        <v-card-title primary-title xs8 sm8>
                            <div>
                                <div class="headline">
                                    {{ trans('data.location_info') }}
                                </div>
                            </div>
                        </v-card-title>
                        <v-divider></v-divider>
                        <v-card-text>
                            <v-container grid-list-md>
                                        <v-layout row wrap>
                                            <v-flex  md3>
                                                <v-text-field
                                                v-model="location.province_municipality"
                                                :label="trans('data.province_municipality')"
                                            >
                                            </v-text-field>
                                              </v-flex> 
                                                <v-flex  md3>
                                                <v-text-field
                                                v-model="location.municipality"
                                                :label="trans('data.municipality')"
                                            ></v-text-field>
                                            </v-flex>
                                               <v-flex  md3>
                                                <v-text-field
                                                v-model="location.plan_id"
                                                :label="trans('data.plan_id')"
                                            ></v-text-field>
                                                </v-flex>
                                               <v-flex  md3>
                                                <v-text-field
                                                v-model="location.piece_number"
                                                :label="trans('data.piece_number')"
                                            ></v-text-field>
                                    
                                            </v-flex> 
                                          
                                        </v-layout>

                                        <v-layout row wrap>
                                            <v-flex  md3>
                                                <v-text-field
                                                v-model="location.size_number"
                                                :label="trans('data.size_number')"
                                            >
                                            </v-text-field>
                                              </v-flex> 
                                                <v-flex  md3>
                                                <v-text-field
                                                v-model="location.instrument_number"
                                                :label="trans('data.instrument_number')"
                                            ></v-text-field>
                                            </v-flex>

                                    <v-flex  md3>
                                        <div class="v-input v-text-field theme--light">
                                            <div class="v-input__control">
                                                <div class="v-input__slot">
                                                    <div class="v-text-field__slot">
                                                        <label
                                                            aria-hidden="true"
                                                            class="v-label v-label--active theme--light flat_picker_label"
                                                        >
                                                            {{ trans('data.instrument_date') }}
                                                        </label>
                                                        <flat-pickr
                                                            v-model="location.instrument_date"
                                                            
                                                            name="instrument_date"
                                                            required
                                                            :config="flatPickerDate()"
                                                            :data-vv-as="trans('data.instrument_date')"
                                                        ></flat-pickr>
                                                    </div>
                                                </div>
                                                <div class="v-messages theme--light error--text">
                                                    {{ errors.first('instrument_date') }}
                                                </div>
                                            </div>
                                        </div>
                                    </v-flex>
                                             
                                             <v-flex  md3>
                                                <v-text-field
                                                v-model="location.northern_border"
                                                :label="trans('data.northern_border')"
                                            >
                                            </v-text-field>
                                              </v-flex> 
                                        </v-layout>


                                       <v-layout row wrap>
                                            <v-flex  md3>
                                                <v-text-field
                                                v-model="location.eastern_border"
                                                :label="trans('data.eastern_border')"
                                            >
                                            </v-text-field>
                                              </v-flex> 
                                                <v-flex  md3>
                                                <v-text-field
                                                v-model="location.western_border"
                                                :label="trans('data.western_border')"
                                            ></v-text-field>
                                            </v-flex>
                                               <v-flex  md3>
                                                <v-text-field
                                                v-model="location.southern_border"
                                                :label="trans('data.southern_border')"
                                            ></v-text-field>
                                                </v-flex>
                                               <v-flex  md3>
                                                <v-text-field
                                                v-model="location.status"
                                                :label="trans('data.status')"
                                            ></v-text-field>
                                    
                                            </v-flex> 
                                          
                                        </v-layout>


                                       <v-layout row wrap>
                                               <v-flex  md3>
                                                <v-text-field
                                                v-model="location.lon"
                                                :label="trans('data.lon')"
                                            ></v-text-field>
                                                </v-flex>
                                               <v-flex  md3>
                                                <v-text-field
                                                v-model="location.lat"
                                                :label="trans('data.lat')"
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
    props:['customerId'],
    data(){
        return{
            location:{
                province_municipality:'',
                municipality:'',
                plan_id :'',
                piece_number:'',

                size_number:'',
                instrument_number:'',
                instrument_date :'',
                northern_border:'',



                eastern_border:'',
                western_border:'',
                southern_border :'',
                status:'',


                lon:'',
                lat:'',

             
            },
        }; 
    },
    created(){
        const self = this;
        self.getCustomerData();
    },
    methods:{
        getCustomerData(){
            // const self = this;
            // axios.post('/customer-info' ,{customer_id:self.customerId}).then(function(response) {
            //     self.customer=response.data;
            //     console.log(self.customer);
            // })
            // .catch(function(error) {
            //     console.log(error);
            // });
        },

            nextStep() {
            this.$emit('next',this.location);
        },
    }
}
</script>