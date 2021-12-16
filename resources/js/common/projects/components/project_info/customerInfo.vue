<template>
    <v-container grid-list-md>
        <AddAgency ref="agencyadded" @fillAgencyData="getAgenctData($event)"></AddAgency>
        <v-layout row>
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
                                <v-layout row wrap v-for="(input, k) in inputs" :key="k">
                                    <v-flex xs12 md4>
                                        <v-autocomplete
                                            item-text="name"
                                            item-value="id"
                                            :items="customers"
                                            v-model="input.id"
                                            :label="trans('messages.name')"
                                            v-validate="'required'"
                                            data-vv-name="name"
                                            :data-vv-as="trans('messages.name')"
                                            @change="(event) => updatevalues(event, k)"
                                            :error-messages="errors.collect('name')"
                                            
                                            required
                                        ></v-autocomplete>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                        <v-text-field
                                            v-model="input.id_card_number"
                                            type="number"
                                            :label="trans('data.id_card_number')"
                                            readonly
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                        <v-text-field
                                            :label="trans('messages.email')"
                                            v-model="input.email"
                                            v-validate="'required|email'"
                                            data-vv-name="email"
                                            :data-vv-as="trans('messages.email')"
                                            :error-messages="errors.collect('email')"
                                            readonly
                                            required
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                        <v-text-field
                                            v-model="input.mobile"
                                            type="number"
                                            :label="trans('messages.mobile')"
                                            readonly
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                        <v-btn
                                            @click="add(k)"
                                            small
                                            v-show="k == inputs.length - 1"
                                            fab
                                            style="background-color: #06706d; color: white"
                                        >
                                            <v-icon dark> add </v-icon>
                                        </v-btn>
                                        <v-btn
                                            @click="remove(k)"
                                            v-show="k || (!k && inputs.length > 1)"
                                            small
                                            fab
                                            color="red"
                                            dark
                                        >
                                            <i class="fas fa-minus-circle"></i>
                                        </v-btn>
                                    </v-flex>
                                </v-layout>
                            </v-form>
                            <div v-show="true">
                                <v-layout row wrap class="add-agency">
                                    <v-flex md3>
                                        <v-autocomplete
                                            item-text="trade_name"
                                            item-value="id"
                                            :items="agencies"
                                            v-model="agency.id"
                                            @change="(event) => updateAgentvalues(event)"
                                            :label="trans('data.trade_name')"
                                        ></v-autocomplete>
                                    </v-flex>
                                    <v-flex md3>
                                        <v-text-field
                                            v-model="agency.record_number"
                                            :label="trans('data.record_number')"
                                            readonly
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex md3>
                                        <v-text-field
                                            :label="trans('messages.email')"
                                            v-model="agency.email"
                                            v-validate="'email'"
                                            data-vv-name="email"
                                            readonly
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex md3>
                                        <v-text-field
                                            v-model="agency.mobile"
                                            type="number"
                                            :label="trans('messages.mobile')"
                                        ></v-text-field>
                                    </v-flex>
                                </v-layout>
                                <v-layout row wrap>
                                    <v-flex md3>
                                        <v-text-field
                                            v-model="agency.delegate_record"
                                            :label="trans('data.delegate_record')"
                                            readonly
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex md3>
                                        <v-text-field
                                            v-model="agency.agency_number"
                                            :label="trans('data.agency_number')"
                                            readonly
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex md3>
                                        <v-text-field
                                            v-model="agency.agent_name"
                                            :label="trans('data.agent_name')"
                                            readonly
                                        >
                                        </v-text-field>
                                    </v-flex>
                                    <v-flex md3>
                                        <v-text-field
                                            v-model="agency.agent_card_number"
                                            :label="trans('data.agent_card_number')"
                                            readonly
                                        ></v-text-field>
                                    </v-flex>
                                </v-layout>
                            </div>
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
                                <v-flex md3>
                                    <v-btn
                                        @click="createAgency"
                                        large
                                        dark
                                        style="background-color: #06706d; color: white"
                                    >
                                        Add Agency
                                        <!-- //<v-icon>add</v-icon> -->
                                    </v-btn>
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
import AddAgency from './AddAgency.vue';
export default {
    components: {
        AddAgency,
    },
    props: ['customerId'],
    data() {
        return {
            inputs: [
                {
                    id: '',
                    id_card_number: '',
                    email: '',
                    mobile: '',
                },
            ],
            customers: [],
            agencies: [],
            isAgency: false,
            agency: {
                trade_name: null,
                record_number: null,
                delegate_record: null,
                agency_number: null,
                agent_name: null,
                agent_card_number: null,
                email: null,
                mobile: null,
                id: null,
            },
             isEdit:false,
        };
    },
    created() {
        const self = this;
        self.getCustomers();
        //self.getAgenciesData(0)
        //   self.getAgenciesData();
        ///   self.getCustomerData();
        //   return this.$v.$touch();
    },
    mounted() {
        const self = this;
       ;
    },
    methods: {
        getAgenctData(data) {
            const self = this;
            self.agencies.push(data);
            //this.isAgency = true;
        },
        add() {
            this.inputs.push({
                id: '',
                id_card_number: '',
                email: '',
                mobile: '',
            });
            console.log(this.inputs);
        },

        remove(index) {
            this.inputs.splice(index, 1);
        },
        updatevalues(value, key) {
            const self = this;
            self.current_customer = value;
            let x = self.customers.find((o) => o.id === value);
            self.inputs[key].mobile = x.mobile;
            self.inputs[key].id_card_number = x.id_card_number;
            self.inputs[key].email = x.email;
            self.resetAgentvalues();
            self.getAgenciesData(value);
        },
        resetvalues(value, key = 0) {
            const self = this;
            let x = self.customers.find((o) => o.id === value);
            self.inputs[key].id = x.id;
            self.inputs[key].mobile = x.mobile;
            self.inputs[key].id_card_number = x.id_card_number;
            self.inputs[key].email = x.email;
        },
        updateAgentvalues(value) {
            const self = this;
            var x = self.agencies.find((o) => o.id == value);

            self.agency.record_number = x.record_number;
            self.agency.agency_number = x.agency_number;
            self.agency.delegate_record = x.delegate_record;
            self.agency.agent_name = x.agent_name;
            self.agency.agent_card_number = x.agent_card_number;
            self.agency.email = x.email;
            self.agency.mobile = x.mobile;
        },
        resetAgentvalues() {
            const self = this;
            self.agency.id = null;
            self.agency.record_number = null;
            self.agency.agency_number = null;
            self.agency.delegate_record = null;
            self.agency.agent_name = null;
            self.agency.agent_card_number = null;
            self.agency.email = null;
            self.agency.mobile = null;
        },
        getCustomers() {
            const self = this;
            axios
                .get('/all-customers')
                .then(function (response) {
                    self.customers = response.data;
                    //  self.resetvalues(1);
                })
                .catch(function (error) {
                    console.log(error);
                });
        },

        getAgenciesData(value) {
            const self = this;
            axios
                .get('/get-agencies/' + value)
                .then(function (response) {
                    self.agencies = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        nextStep() {
            this.$validator.validateAll().then((result) => {
                if (result == true) {
                    var data = {
                        customers: this.inputs,
                        agency_id: this.agency.id,
                    };
                    this.$emit('next', data);
                } else {
                    this.$refs.form.validate();
                }
            });
        },

        fillEditData(data,agency) {
             const self = this;
               self.agencies.push(agency);
            self.inputs[0]=data;
            self.agency=agency;
         
        },
        createAgency() {
            const self = this;
            this.$refs.agencyadded.create();
        },
    },
};
</script>