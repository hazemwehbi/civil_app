<template>
    <v-container grid-list-md>
            <v-layout row >
                <v-flex xs12 sm12>
                    <v-card class="elevation-3">
                        <v-card-title primary-title xs8 sm8>
                            <div>
                                <div class="headline">
                                    {{ trans('data.customer_info') }}
                                </div>
                            </div>
                        </v-card-title>
                        <v-divider></v-divider>
                        <v-card-text>
                            <v-container grid-list-md>
                             <v-form ref="form">
                                        <v-layout row wrap>
                                            <v-flex  md3 >
                                           
                                                <v-text-field
                                                 v-model="customer.name"
                                              :label="trans('messages.name')"
                                    v-validate="'required'"
                                    data-vv-name="name"
                                    :data-vv-as="trans('messages.name')"
                                    :error-messages="errors.collect('name')"
                                            required
                                           
                                            >
                                            </v-text-field>
                                         
                                              </v-flex> 
                                                <v-flex  md3>
                                                <v-text-field
                                                v-model="customer.id_card_number"
                                                :label="trans('data.id_card_number')"
                                            ></v-text-field>
                                            </v-flex>
                                               <v-flex  md3>
                                                <v-text-field
                                                v-model="customer.email"
                                                :label="trans('messages.email')"
                                            ></v-text-field>
                                                </v-flex>
                                               <v-flex  md3>
                                                <v-text-field
                                                v-model="customer.mobile"
                                                :label="trans('messages.mobile')"
                                            ></v-text-field>
                                    
                                            </v-flex> 
                                          
                                        </v-layout>
                                           </v-form>
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
            customer:{
                name:'',
                id_card_number:'',
                email :'',
                mobile:'',
             
            },
        }; 
    },
    created(){
        const self = this;
     ///   self.getCustomerData();
        //   return this.$v.$touch();

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
            this.$validator.validateAll().then(result => {
                alert(result)
                if (result == true) {
                  this.$emit('next',this.customer);
                }
                else{
                 this.$refs.form.validate();
                }
            });
            
           },
    }
}
</script>