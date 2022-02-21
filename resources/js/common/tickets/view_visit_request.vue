<template>
    <v-container row justify-center>
        <AddRequestType ref="RequestTypeAdd"></AddRequestType>
        <v-card>
            <v-divider></v-divider>
            <v-card-text>
                <v-container grid-list-md>
                    <v-layout row wrap>
                        <!-- <v-flex xs12 sm6 md6>
                            <v-autocomplete
                                item-text="value"
                                item-value="key"
                                :readonly="true"
                                :items="request_types"
                                v-model="request_type"
                                :label="trans('data.request_type')"
                                v-validate="'required'"
                                data-vv-name="request_type"
                                :data-vv-as="trans('data.request_type')"
                                :error-messages="errors.collect('request_type')"
                                required
                            ></v-autocomplete>
                        </v-flex> -->

                        <v-flex xs12 sm6 md6>
                            <v-autocomplete
                                item-text="name"
                                 :readonly="true"
                                item-value="id"
                                :items="projects"
                                v-model="project_id"
                                :label="trans('data.project_name')"
                                v-validate="'required'"
                                data-vv-name="project_name"
                                :data-vv-as="trans('data.project_name')"
                                :error-messages="errors.collect('project_name')"
                                required
                            ></v-autocomplete>
                        </v-flex>
                        <!-- <v-flex xs1 sm1 md1>
                                <v-btn
                                    @click="createRequestType"
                                    small
                                    fab
                                    dark
                                    style="background-color:#06706d;color:white;"
                                >
                                    <v-icon>add</v-icon>
                                </v-btn>
                            </v-flex> -->
                            <v-flex xs12 sm6 md6>
                            <v-autocomplete
                                item-text="name"
                                item-value="id"
                                :items="customers"
                                 :readonly="true"
                                v-model="customer_id"
                                :label="trans('messages.customer')"
                                v-validate="'required'"
                                data-vv-name="customer"
                                :data-vv-as="trans('messages.customer')"
                                :error-messages="errors.collect('customer')"
                                required
                            ></v-autocomplete>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <!-- v-if="$hasRole('employee')" -->
                        <!-- <v-flex xs12 sm4 md4 >
                            <v-autocomplete
                                item-text="value"
                                item-value="key"
                                :items="statuses"
                                v-model="status"
                                :label="trans('messages.status')"
                                data-vv-name="status"
                                :data-vv-as="trans('messages.status')"
                                :error-messages="errors.collect('status')"
                            ></v-autocomplete>
                        </v-flex> -->
                  

                        <v-flex xs12 sm6 md6>
                            <v-autocomplete
                                item-text="name"
                                item-value="id"
                                :items="engennering_offices"
                                v-model="office_id"
                                 :readonly="true"
                                :label="trans('data.enginnering_office_name')"
                                v-validate="'required'"
                                data-vv-name="enginnering_office_name"
                                :data-vv-as="trans('data.enginnering_office_name')"
                                :error-messages="errors.collect('enginnering_office_name')"
                                required
                            ></v-autocomplete>
                        </v-flex>
                        
                     
                        <v-flex xs12 sm6 md6>
                            <v-datetime-picker
                                :label="trans('visit_datetime')"
                                :datetime="dead_line_date"
                                 :readonly="true"
                                v-model="dead_line_date"
                            >
                            </v-datetime-picker>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12 sm12 md12>
                            <v-autocomplete
                                item-text="value"
                                item-value="key"
                                :items="enginnering_types"
                                v-model="enginnering_type"
                                 :readonly="true"
                                :label="trans('data.enginnering_type')"
                                multiple
                                data-vv-name="enginnering_type"
                                :data-vv-as="trans('data.enginnering_type')"
                                :error-messages="errors.collect('enginnering_type')"
                                required
                            >
                                <!-- <Popover
                                    slot="append"
                                    :helptext="trans('messages.project_member_tooltip')"
                                >
                                </Popover> -->
                            </v-autocomplete>
                        </v-flex>
                       
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12 sm12 md12>
                            <v-text-field
                                v-model="note"
                                 :readonly="true"
                                :label="trans('data.note')"
                            ></v-text-field>
                        </v-flex>

                    </v-layout>
                    <!-- <v-flex xs1 sm1 md1>
                            <v-btn
                                @click="$router.push({ name: 'add-project' })"
                                small
                                fab
                                dark
                                style="background-color: #06706d; color: white"
                            >
                                <v-icon>add</v-icon>
                            </v-btn>
                        </v-flex> -->

                    <v-layout row>
                        <v-flex xs12 sm12 md12>
                            <v-textarea
                                rows="4"
                                v-model="description"
                                :label="trans('messages.description')"
                                v-validate="'required'"
                                 :readonly="true"
                                data-vv-name="description"
                                :data-vv-as="trans('messages.description')"
                                :error-messages="errors.collect('description')"
                                required
                            ></v-textarea>
                        </v-flex>
                    </v-layout>

                    <v-layout row wrap>
                        <!--    <v-flex xs12 sm6 md6 v-if="$hasRole('employee')">
                                <v-autocomplete
                                    item-text="name"
                                    item-value="id"
                                    :items="employees"
                                    v-model="assigned_to"
                                    :label="trans('messages.assigned_to')"
                                ></v-autocomplete>
                            </v-flex>-->
                        <!-- <v-flex xs12 sm6 md6 v-if="$hasRole('employee')"> </v-flex> -->
                    </v-layout>
                </v-container>
            </v-card-text>
            <v-divider></v-divider>
                  <v-layout justify-center>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn style="color: #06706d" @click="$router.go(-1)">
                        {{ trans('messages.back') }}
                    </v-btn>
                </v-card-actions>
            </v-layout>
        </v-card>
    </v-container>
</template>
<script>
import AddRequestType from './AddRequestType';
export default {
    components: {
        AddRequestType,
    },
    props: {
        propRequestId: {
            required: true,
        },
        // propisView: {
        //     required: true,
        // },
        propVisitRequest: {
            required: true,
        },
    },
    data() {
        return {
            type: '',
            isView: false,
            project_id: '',
            projects: [],
            enginnering_types: [],
            visit_request: null,
            loading: false,
            title: '',
            request_type: '',
            project_id: '',
            description: '',
            status: 'new',
            priority: '',
            customer_id: '',
            statuses: [],
            employees: [],
            request_types: [],
            customers: [],
            priorities: [],
            request_type: '',
            engennering_offices: [],
            office_id: '',
            dead_line_date: null,
            note: '', //
            enginnering_type: '',
        };
    },
    created() {
    
    },
    beforeDestroy() {
        const self = this;
        self.$eventBus.$off('updateCategoryList');
    },
    mounted() {
        const self = this;
      
        self.getCustomerProject();
        self.getCustomers();
        self.getOffices();
        this.loadRequest(() => {});
          self.$eventBus.$on('updateRequestTypeList', (data) => {
            //  self.request_types = [];
            // self.request_types = data;
        });
    },
    methods: {
        loadRequest() {
            const self = this;
            axios.get('request/' + self.propRequestId).then(function (response) {
                self.enginnering_types = response.data.enginnering_types;
                self.request_types = response.data.request_types;
                self.request_type = response.data.request.request_type;
                self.project_id = response.data.request.project_id;
                self.description = response.data.request.description;
                self.status = response.data.request.status;
                self.customer_id = response.data.request.customer_id;
                self.office_id = response.data.request.office_id;
                self.enginnering_type = JSON.parse(response.data.request.enginnering_type);
                self.note = response.data.request.note;
                self.dead_line_date = response.data.request.dead_line_date;
            });
        },
        getCustomers() {
            const self = this;
            axios
                .get('/all-customers')
                .then(function (response) {
                    self.customers = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        getOffices() {
            const self = this;
            axios
                .get('/get-offices')
                .then(function (response) {
                    self.engennering_offices = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
      
        reset() {
            const self = this;
            self.title = '';
            self.request_type = '';
            self.project_id = '';
            self.description = '';
            self.status = '';
            self.priority = '';
            self.customer_id = '';
            self.office_id = '';
            self.note = ''; //
            self.enginnering_type = '';
        },
      
        getCustomerProject() {
            const self = this;
            axios
                .get('/projects-customer')
                .then(function (response) {
                    self.projects = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
     

    },
};
</script>
