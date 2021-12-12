<template>
    <v-container row justify-center>
        <AddRequestType ref="RequestTypeAdd"></AddRequestType>
            <v-card>
                <v-divider></v-divider>
                <v-card-text>
                    <v-container grid-list-md>
                        <v-layout row wrap>
                            <v-flex xs12 sm6 md6>
                                <v-text-field
                                    v-model="title"
                                    :label="trans('messages.title')"
                                    v-validate="'required'"
                                    data-vv-name="title"
                                    :data-vv-as="trans('messages.title')"
                                    :error-messages="errors.collect('title')"
                                    required
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md6>
                                  <v-autocomplete
                                    item-text="value"
                                    item-value="key"
                                    :items="request_types"
                                    v-model="request_type"
                                    :label="trans('data.request_type')"
                                    v-validate="'required'"
                                    data-vv-name="request_type"
                                    :data-vv-as="trans('data.request_type')"
                                    :error-messages="errors.collect('request_type')"
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
              
                        </v-layout>
                        <v-layout row>

               

                                          <v-flex xs12 sm4 md4>
                                  <v-autocomplete
                                    item-text="name"
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
                            <!-- v-if="$hasRole('employee')" -->
                                    <v-flex xs12 sm6 md6 >
                                <v-autocomplete
                                    item-text="name"
                                    item-value="id"
                                    :items="customers"
                                    v-model="customer_id"
                                    :label="trans('messages.customer')"
                                    v-validate="'required'"
                                    data-vv-name="customer"
                                    :data-vv-as="trans('messages.customer')"
                                    :error-messages="errors.collect('customer')"
                                    required
                                ></v-autocomplete>
                            </v-flex>
                            <!-- v-if="$hasRole('employee')" -->
                                                <v-flex xs12 sm4 md4 >
                                <v-autocomplete
                                    item-text="value"
                                    item-value="key"
                                    :items="priorities"
                                    v-model="priority"
                                    :label="trans('messages.priority')"
                                ></v-autocomplete>
                            </v-flex>
                        <!--    <v-flex xs1 sm1 md1>
                                <v-btn
                                    @click="$router.push({name: 'add-project'})"
                                    small
                                    fab
                                    dark
                                    style="background-color:#06706d;color:white;"
                                >
                                    <v-icon>add</v-icon>
                                </v-btn>
                            </v-flex>-->
                        </v-layout>
                        <v-layout row>
                            <v-flex xs12 sm12 md12>
                                <v-textarea
                                    rows="4"
                                    v-model="description"
                                    :label="trans('messages.description')"
                                    v-validate="'required'"
                                    data-vv-name="description"
                                    :data-vv-as="trans('messages.description')"
                                    :error-messages="errors.collect('description')"
                                    required
                                ></v-textarea>
                            </v-flex>
                   
                        </v-layout>
                    <!--    <v-layout row>
                            <v-flex xs12 sm6 md6 v-if="$hasRole('employee')">
                                <v-autocomplete
                                    item-text="value"
                                    item-value="key"
                                    :items="statuses"
                                    v-model="status"
                                    :label="trans('messages.status')"
                                    v-validate="'required'"
                                    data-vv-name="status"
                                    :data-vv-as="trans('messages.status')"
                                    :error-messages="errors.collect('status')"
                                    required
                                ></v-autocomplete>
                            </v-flex>
              
                        </v-layout>-->
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
       
                        </v-layout>
                    </v-container>
                </v-card-text>
                <v-divider></v-divider>
                <v-layout justify-center>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn  style="color:#06706d;"  @click="reset">
                        {{ trans('data.reset') }}
                    </v-btn>
                    <v-btn style="background-color:#06706d;color:white;" color="darken-1" @click="store(1)" :loading="loading" :disabled="loading">
                        {{ trans('messages.save') }}
                    </v-btn>
                    <v-btn style="color:#06706d;" @click="$router.go(-1)">
                        {{ trans('messages.back') }}
                    </v-btn>
                    <v-btn v-if="!$can('superadmin')" style="background-color:#06706d;color:white;" color="darken-1" @click="store(0)" :loading="loading" :disabled="loading">
                        {{ trans('messages.draft') }}
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
    data() {
        return {
            type:'',
            project_id:'',
            projects:[],
            visit_request:'',
            loading: false,
            title:'',
            request_type:'',
            description:'',
            status:'new',
            priority:'',
            customer_id:'',
            statuses: [],
            employees: [],
            request_types:[],
            customers: [],
            priorities: [],
            request_type:''
        };
    },
    created() {
        const self = this;
        self.reset();
        self.project_id = self.project_id = self.$route.params.project_id;
        self.customer_id = self.customer_id = self.$route.params.customer_id;
        self.request_type=self.$route.params.request_type;
        self.getRequestTypes();
        self.getCustomerProject();
        self.getCustomers();
        self.getpriority();
        
    },
    beforeDestroy() {
        const self = this;
        self.$eventBus.$off('updateCategoryList');
    },
     mounted() {
        const self = this;
        self.$eventBus.$on('updateRequestTypeList', data => {
            self.request_types=[];
            self.request_types=data;
        });
     },
    methods: {
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
        reset(){
            const self = this;
            self.title="";
            self.request_type="";
            self.project_id="";
            self.description="";
            self.status="";
            self.priority="";
            self.customer_id="";
           // self.request_types=[];
        },
        getRequestTypes(){
            const self = this;
            axios
                .get('/get-request-types')
                .then(function(response) {
                    self.request_types = response.data;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },

          getpriority(){
            const self = this;
            axios
                .get('/get-priority')
                .then(function(response) {
                    self.priorities = response.data;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },
        getCustomerProject(){
            const self = this;
            axios
                .get('/projects-customer')
                .then(function(response) {
                    self.projects = response.data;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },
        createRequestType() {
            const self = this;
            self.$refs.RequestTypeAdd.create();
        },
        store(val) {
            const self = this;
            let data={
                sent:val,
                title:self.title,
                request_type:self.request_type,
                project_id:self.project_id,
                description:self.description,
                status:'new',
                priority:self.priority,
                customer_id:self.customer_id
            }
           console.log(data)
            self.$validator.validateAll().then(result => {
                if (result == true) {
                    self.loading = true;
                    axios
                        .post('/visit-request', data)
                        .then(function(response) {
                            self.loading = false;
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });

                            if (response.data.success === true) {
                              //   self.dialog = false;
                                self.$eventBus.$emit('updateTicketsTable');
                                 self.goBack();
                            }
                           
                        })
                        .catch(function(error) {
                            console.log(error);
                        });
                }
            });
             //self.reset();
        },
    },
};
</script>
