<template>
    <v-container row justify-center>
        <v-card>
            <v-divider></v-divider>
            <v-card-text>
                <v-container grid-list-md>
                    <v-layout row wrap>
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
                        <!--<v-flex xs12 sm6 md6>
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
                        </v-flex>-->

                        <v-flex xs12 sm6 md6>
                            <v-datetime-picker
                                :label="trans('data.visit_datetime')"
                                :datetime="dead_line_date"
                                :disabled="true"
                                :okText="trans('data.ok')"
                                :clearText="trans('data.clear')"
                                v-model="dead_line_date"
                            >
                            </v-datetime-picker>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12 sm12 md12>
                                <v-text-field
                                        v-model="enginnering_type"
                                        :label="trans('data.enginnering_type')"
                                    ></v-text-field>
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
                    <!-- <v-layout row v-if="status == 'accepted'">
                        <v-flex xs12 sm12 md12>
                            <v-text-field
                                v-model="enginnering_request"
                                :readonly="true"
                                :label="trans('data.engennering_request')"
                            ></v-text-field>
                        </v-flex>
                    </v-layout> -->
                    <v-container grid-list-md v-if="request_enginners.length > 0" >
                          <h3>{{trans('data.employee_and_Dead_lines')}}</h3>
                        <v-layout v-for="enginner in request_enginners" :key="enginner.id">
                            <v-flex xs12 md12>
                                <v-card light>
                                    <v-card-text>
                                        <div>
                                            <!-- <v-icon small>create</v-icon> -->
                                           <h3>
                                            {{ enginner.employee.name }}
                                            </h3>
                                            {{trans('data.dead_line_date')}}
                                            ::
                                            <!-- <v-icon small>date_range</v-icon> -->
                                           <span> {{ enginner.dead_line_date !=null ?  enginner.dead_line_date : 'لم يحدد بعد'}} </span>
                                        </div>
                                    </v-card-text>
                                </v-card>
                            </v-flex>
                        </v-layout>
                    </v-container>
                    <v-layout row wrap> </v-layout>
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
export default {
    components: {},
    props: {
        propRequestId: {
            required: true,
        },
        // propisView: {
        //     required: true,
        // },
        propVisitRequest: {
         //   required: true,
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
            enginnering_request: '',
            note: '', //
            enginnering_type: '',
            request_enginners: [],
        };
    },
    created() {
        this.getEnginners();
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
        //
        this.loadRequest(() => {});
        self.$eventBus.$on('updateRequestTypeList', (data) => {
            //  self.request_types = [];
            // self.request_types = data;
        });
    },
    methods: {
        getEnginners() {
            const self = this;
            axios.get('get-requests-enginners/' + self.propRequestId).then(function (response) {
                console.log(response.data);
                self.request_enginners = response.data;
                //  self.enginnering_request = response.data.join(',');
            });
        },
        loadRequest() {
            const self = this;

            axios.get('/enginner_office/request/' + self.propRequestId).then(function (response) {
                if (response.data.success) {
                    console.log(response.data);
                    var tem = response.data.msg;
                    self.request_types = tem.request_types;
                    self.request_type = tem.request.request_type;
                    self.project_id = tem.request.project_id;
                    self.description = tem.request.description;
                    self.status = tem.request.status;
                    self.customer_id = tem.request.customer_id;
                    self.office_id = tem.request.office_id;
                    
                         self.enginnering_type =
                        tem.request.specialties != undefined
                            ? tem.request.specialties.map((x) => x.name).join(',')
                            : '';
                    self.note = tem.request.note;
                    self.dead_line_date = tem.request.dead_line_date;
                } else {
                    self.$store.commit('showSnackbar', {
                        message: response.data.msg,
                        color: response.data.success,
                    });
                }
            });
        },
        getCustomers() {
            const self = this;
            axios
                .get('/enginner_office/customers')
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
                .get('enginner_office/projects-request')
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
