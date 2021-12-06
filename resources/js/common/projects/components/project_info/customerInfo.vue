<template>
    <v-container grid-list-md>
        <AddAgency ref="agencyadded"></AddAgency>
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

                                        <v-layout row wrap v-for="(input,k) in inputs" :key="k">
                                            <v-flex xs12  md4 >
                                    <v-autocomplete
                                    item-text="name"
                                    item-value="id"
                                    :items="customers"
                                     v-model="input.id"
                                     :label="trans('messages.name')"
                                    v-validate="'required'"
                                    data-vv-name="name"
                                    :data-vv-as="trans('messages.name')"
                                     @change="(event) => updatevalues(event,k)"
                                    :error-messages="errors.collect('name')"
                                    required
                                ></v-autocomplete>
                                            
                                              </v-flex> 
                                                <v-flex  xs12  md4>
                                                <v-text-field
                                                v-model="input.id_card_number"
                                                 type="number"
                                                :label="trans('data.id_card_number')"
                                            ></v-text-field>
                                            </v-flex>
                                               <v-flex xs12  md4>
                                                   <v-text-field
                                                    :label="trans('messages.email')"
                                                    v-model="input.email"
                                                    v-validate="'required|email'"
                                                    data-vv-name="email"
                                                    :data-vv-as="trans('messages.email')"
                                                    :error-messages="errors.collect('email')"
                                                    required
                                                ></v-text-field>
                                                </v-flex>
                                               <v-flex xs12  md4>
                                                <v-text-field
                                                 v-model="input.mobile"
                                                  type="number"
                                                :label="trans('messages.mobile')"
                                            ></v-text-field>
                                            </v-flex> 
                                            <v-flex  xs12  md4>
                                               
                                <v-btn
                                    @click="add(k)"
                                    small
                                    v-show="k == inputs.length-1"
                                    fab
                                    style="background-color:#06706d;color:white;"
                                >
                                     <v-icon dark>
                                        add
                                    </v-icon>
                                </v-btn>
                                 <v-btn
                                    @click="remove(k)"
                                    v-show="k || ( !k && inputs.length > 1)"
                                    small
                                    fab
                                     color="red"
                                    dark
                                >
                                 <i class="fas fa-minus-circle"></i>
                                   
                                </v-btn>
                            </v-flex>

                                       
                                        </v-layout>
                                        <!-- <v-layout row wrap>
                                            <v-flex  md3 >
                                                                   <v-autocomplete
                                    item-text="name"
                                    item-value="id"
                                    :items="customers"
                                     v-model="customer.id2"
                                     :label="trans('data.name2')"
                                    v-validate="'required'"
                                    data-vv-name="name"
                                    :data-vv-as="trans('data.name2')"
                                     @change="(event) => updateRegion2(event)"
                                    :error-messages="errors.collect('name2')"
                                            required
                                ></v-autocomplete>
                                              </v-flex> 
                                                <v-flex  md3>
                                                <v-text-field
                                                v-model="customer.id_card_number2"
                                                 type="number"
                                                :label="trans('data.id_card_number')"
                                            ></v-text-field>
                                            </v-flex>
                                               <v-flex  md3>
                                                   <v-text-field
                                                    :label="trans('messages.email')"
                                                    v-model="customer.email2"
                                                    v-validate="'required|email'"
                                                    data-vv-name="email"
                                                    :data-vv-as="trans('messages.email')"
                                                    :error-messages="errors.collect('email')"
                                                    required
                                                ></v-text-field>
                                                </v-flex>
                                               <v-flex  md3>
                                                <v-text-field
                                                 v-model="customer.mobile2"
                                                  type="number"
                                                :label="trans('messages.mobile')"
                                            ></v-text-field>
                                            </v-flex> 
                                        </v-layout> -->
                                             <v-layout row wrap>
                                            <v-flex  md3 >
                                        <v-btn
                                                @click="createAgency"
                                                large
                                                dark
                                                style="background-color:#06706d;color:white;"
                                          >
                                          Add Agency
                                    <!-- //<v-icon>add</v-icon> -->
                                </v-btn>
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
import AddAgency from './AddAgency.vue'
export default {
        components: {
        AddAgency,
    },
    props:['customerId'],
    data(){
        return{
     inputs: [{
        id: '',
        id_card_number: '',
        email: '',
        mobile: ''
      }],
            customers:[],
        }; 
    },
    created(){
        const self = this;
        self.getCustomers();
     ///   self.getCustomerData();
        //   return this.$v.$touch();

    },
    methods:{
        add () {
      this.inputs.push({
        id: '',
        id_card_number: '',
        email: '',
        mobile: ''
      })
      console.log(this.inputs)
    },

    remove (index) {
      this.inputs.splice(index, 1)
    },
        updatevalues(value,key){
          const self = this;
          let x =self.customers.find(o => o.id === value);
          self.inputs[key].mobile=x.mobile;
          self.inputs[key].id_card_number=x.id_card_number;
          self.inputs[key].email=x.email;
        },
        getCustomers(){
            const self = this;
            axios
                .get('/all-customers')
                .then(function(response) {
                    self.customers = response.data;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },
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
              //  alert(result)
                if (result == true) {
                  this.$emit('next',this.inputs);
                }
                else{
                 this.$refs.form.validate();
                }
            });
            
           },


        createAgency() {
            const self = this;
            this.$refs.agencyadded.create();
        },
           
    }
}
</script>