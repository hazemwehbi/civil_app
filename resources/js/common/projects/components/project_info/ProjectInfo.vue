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
                        <v-form ref="form">
                            <v-container grid-list-md>
                                <v-layout row wrap>
                                    <v-flex xs12 md6>
                                        <v-text-field
                                           :readonly="isEdit"
                                            v-model="project.name"
                                            :label="trans('messages.name')"
                                            v-validate="'required'"
                                            data-vv-name="name"
                                            :data-vv-as="trans('messages.name')"
                                            :error-messages="errors.collect('name')"
                                            required
                                        >
                                        </v-text-field>
                                    </v-flex>
                                    <!--   <v-flex xs12 md5  v-if="$hasRole('employee') ||$can('superadmin')">
                                        <v-autocomplete
                                            item-text="name"
                                            item-value="id"
                                            :items="categories"
                                            v-model="category_id"
                                            multiple
                                            :label="trans('messages.category')"
                                            data-vv-name="category"
                                            :data-vv-as="trans('messages.category')"
                                            :error-messages="errors.collect('category')"
                                            required
                                        ></v-autocomplete>
                                    </v-flex>
                                    <v-flex md1 v-if="$hasRole('employee') ||$can('superadmin')">
                                        <v-btn @click="createCategory" small :color="'#06706d'" fab dark>
                                            <v-icon>add</v-icon>
                                        </v-btn>
                                    </v-flex>-->
                                </v-layout>
                                <v-layout row wrap>
                                    <v-flex xs12 sm12 md12>
                                        {{ trans('messages.description') }}
                                        <br />
                                        <quill-editor :readonly="isEdit" v-model="project.description"> </quill-editor>
                                    </v-flex>
                                </v-layout>
                                <v-layout wrap>
                                    <!-- <v-flex xs12 md4 v-if="$hasRole('employee') ||$can('superadmin')">
                                        <v-autocomplete
                                            item-text="name"
                                            item-value="id"
                                            :items="customers"
                                            v-model="project.customer_id"
                                            :label="trans('messages.customer')"
                                        ></v-autocomplete>
                                    </v-flex> -->

                                    <v-flex xs12 md4>
                                        <v-select
                                            item-text="value"
                                            item-value="key"
                                            :items="status"
                                            v-model="project.status"
                                            :label="trans('messages.status')"
                                            :data-vv-name="status"
                                            not_started
                                            v-validate="'required'"
                                            :data-vv-as="trans('messages.status')"
                                            :error-messages="errors.collect('status')"
                                            :readonly="isEdit"
                                            required
                                        ></v-select>
                                    </v-flex>
                                    <!-- v-if="$hasRole('employee') ||$can('superadmin')" -->
                                    <!-- <v-flex xs12 md4>
                                        <v-autocomplete
                                            item-text="name"
                                            item-value="id"
                                            :items="users"
                                            v-model="project.lead_id"
                                            :label="trans('messages.lead')"
                                            data-vv-name="lead"
                                            :data-vv-as="trans('messages.lead')"
                                            :error-messages="errors.collect('lead')"
                                            required
                                        >
                                            <Popover
                                                slot="append"
                                                :helptext="trans('messages.project_lead_tooltip')"
                                            >
                                            </Popover>
                                        </v-autocomplete>
                                    </v-flex> -->

                                    <v-flex xs12 md4>
                                        <div class="v-input v-text-field theme--light">
                                            <div class="v-input__control">
                                                <div class="v-input__slot">
                                                    <div class="v-text-field__slot">
                                                        <label
                                                            aria-hidden="true"
                                                            class="
                                                                v-label v-label--active
                                                                theme--light
                                                                flat_picker_label
                                                            "
                                                        >
                                                            {{ trans('messages.start_date') }}
                                                        </label>
                                                        <flat-pickr
                                                            v-model="project.start_date"
                                                            :readonly="isEdit"
                                                            name="start_date"
                                                            required
                                                            :config="flatPickerDate()"
                                                            :data-vv-as="
                                                                trans('messages.start_date')
                                                            "
                                                        ></flat-pickr>
                                                    </div>
                                                </div>
                                                <div class="v-messages theme--light error--text">
                                                    {{ errors.first('start_date') }}
                                                </div>
                                            </div>
                                        </div>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                        <v-autocomplete
                                            item-text="name"
                                            item-value="id"
                                            :items="users"
                                            :readonly="isEdit"
                                            v-model="project.users_id"
                                            :label="trans('messages.members')"
                                            v-validate="'required'"
                                            multiple
                                            data-vv-name="members"
                                            :data-vv-as="trans('messages.members')"
                                            :error-messages="errors.collect('members')"
                                            required
                                        >
                                            <Popover
                                                slot="append"
                                                :helptext="trans('messages.project_member_tooltip')"
                                            >
                                            </Popover>
                                        </v-autocomplete>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                        <div class="v-input v-text-field theme--light">
                                            <div class="v-input__control">
                                                <div class="v-input__slot">
                                                    <div class="v-text-field__slot">
                                                        <label
                                                            aria-hidden="true"
                                                            class="
                                                                v-label v-label--active
                                                                theme--light
                                                                flat_picker_label
                                                            "
                                                        >
                                                            {{ trans('messages.end_date') }}
                                                        </label>
                                                        <flat-pickr
                                                            v-model="project.end_date"
                                                            :readonly="isEdit"
                                                            name="end_date"
                                                            required
                                                            :config="flatPickerDate()"
                                                            :data-vv-as="trans('messages.end_date')"
                                                        ></flat-pickr>
                                                    </div>
                                                </div>
                                                <div class="v-messages theme--light error--text">
                                                    {{ errors.first('end_date') }}
                                                </div>
                                            </div>
                                        </div>
                                    </v-flex>

                                    <v-flex xs12 md4>
                                        <v-text-field
                                            v-model="project.authorization_request_number"
                                            :readonly="isEdit"
                                            :label="trans('data.authorization_request_number')"
                                            data-vv-name="Authorization Request Number"
                                            :data-vv-as="trans('data.authorization_request_number')"
                                            :error-messages="
                                                errors.collect('authorization_request_number')
                                            "
                                            required
                                        >
                                        </v-text-field>
                                    </v-flex>

                                    <v-flex xs12 md4>
                                        <v-text-field
                                            v-model="project.license_number"
                                            :readonly="isEdit"
                                            :label="trans('data.license_number')"
                                            data-vv-name="Authorization Request Number"
                                            :data-vv-as="trans('data.license_number')"
                                            :error-messages="errors.collect('license_number')"
                                            required
                                        >
                                        </v-text-field>
                                    </v-flex>

                                    <v-flex xs12 md4>
                                        <v-text-field
                                            v-model="project.plot_number"
                                            :readonly="isEdit"
                                            :label="trans('data.plot_number')"
                                            data-vv-name="Authorization Request Number"
                                            :data-vv-as="trans('data.plot_number')"
                                            :error-messages="errors.collect('plot_number')"
                                            required
                                        >
                                        </v-text-field>
                                    </v-flex>
                                    <!-- 
                                    <v-flex xs12 md4>
                                        <v-text-field
                                            v-model="project.type_of_request"
                                            :label="trans('data.type_of_request')"
                                            
                                            data-vv-name="Authorization Request Number"
                                            :data-vv-as="trans('data.type_of_request')"
                                            :error-messages="errors.collect('type_of_request')"
                                            required
                                        >
                                        </v-text-field>
                                    </v-flex> -->

                                    <v-flex xs12 md4>
                                        <v-text-field
                                            v-model="project.cadastral_decision_number"
                                            :readonly="isEdit"
                                            :label="trans('data.cadastral_decision_number')"
                                            data-vv-name="Authorization Request Number"
                                            :data-vv-as="trans('data.cadastral_decision_number')"
                                            :error-messages="
                                                errors.collect('cadastral_decision_number')
                                            "
                                            required
                                        >
                                        </v-text-field>
                                    </v-flex>

                                    <v-flex xs12 md4>
                                        <v-autocomplete
                                            item-text="value"
                                            item-value="key"
                                            :readonly="isEdit"
                                            :items="buiding_types"
                                            v-model="project.buiding_type"
                                            :label="trans('data.buiding_type')"
                                        >
                                        </v-autocomplete>
                                    </v-flex>

                                    <v-flex xs12 md4>
                                        <v-text-field
                                            type="number"
                                            ref="input"
                                            :readonly="isEdit"
                                            :label="trans('data.unit_number')"
                                            v-model.number="project.unit_number"
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex md4>
                                        <v-text-field
                                            v-model="project.build_rate"
                                            :label="trans('data.build_rate')"
                                            v-validate="'required'"
                                            :readonly="isEdit"
                                            data-vv-name="build_rate"
                                            :data-vv-as="trans('data.build_rate')"
                                            :error-messages="errors.collect('build_rate')"
                                            required
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                        <v-autocomplete
                                            item-text="value"
                                            item-value="key"
                                            :readonly="isEdit"
                                            :items="project_types"
                                            v-model="project.project_type"
                                            :label="trans('data.project_type')"
                                            v-validate="'required'"
                                            data-vv-name="project_type"
                                            :data-vv-as="trans('data.project_type')"
                                            :error-messages="errors.collect('project_type')"
                                            required
                                        ></v-autocomplete>
                                    </v-flex>
                                    <v-flex md4>
                                        <v-autocomplete
                                            item-text="value"
                                            item-value="key"
                                            :readonly="isEdit"
                                            :items="roles_number"
                                            v-model="project.role_number"
                                            :label="trans('data.role_number')"
                                        >
                                        </v-autocomplete>
                                    </v-flex>
                                    <v-flex md4>
                                        <v-autocomplete
                                            item-text="value"
                                            item-value="key"
                                            :readonly="isEdit"
                                            :items="using_types"
                                            v-model="project.using"
                                            :label="trans('data.using')"
                                        >
                                        </v-autocomplete>
                                    </v-flex>
                                </v-layout>
                            </v-container>
                            <v-container grid-list-md>
                                <v-layout row wrap> </v-layout>
                            </v-container>

                            <v-container grid-list-md>
                                <v-layout row wrap> </v-layout>
                            </v-container>
                        </v-form>
                    </v-card-text>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
</template>
<script>
import Popover from '../../../../admin/popover/Popover';
export default {
    components: {
        Popover,
    },
    props: ['projectId'],
    data() {
        return {
            project_types: [],
            status: [],
            users: [],
            categories: [],
            loading: false,

            customers: [],
            //    project: [],
             isEdit:false,
            project: {
                buiding_type: '',
                role_number: 0,
                unit_number: 0,
                build_rate: '',
                using: '',
                name: '',
                project_type: '',
                total_rate: '',
                authorization_request_number: '',
                license_number: '',
                //  type_of_request:'',
                plot_number: '',
                cadastral_decision_number: '',
                start_date: null,
                end_date: null,
                // customer_id:null,
                users_id: null,
                description: null,
                lead_id: null,
                status: null,
                id:'',
                
                //category_id: null,

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
            using_types: [],
            roles_number: [],
            buiding_types: [],
        };
    },
    created() {
        const self = this;
        // self.getProjectData();
        this.create();
    },
    methods: {
        create() {
            const self = this;
            // self.$validator.reset();
            self.category_id = [];
            (self.start_date = null),
                (self.end_date = null),
                axios
                    .get('/projects/create')
                    .then(function (response) {
                        self.customers = response.data.customers;
                        self.project_types = response.data.projectTypes;

                        self.status = response.data.status;
                        self.users = response.data.users;
                        self.categories = response.data.categories;
                        self.buiding_types = response.data.buildingTypes;
                        self.using_types = response.data.buildUsing;
                        self.roles_number = response.data.roles_number;
                         self.project.status=self.status.filter(c=>c.key=='not_started')[0]['key']
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                   
        },
        getProjectData() {
            const self = this;
            axios
                .post('getProject-Data')
                .then(function (response) {
                    // self.using_types=response.data.using_types;
                    self.roles_number = response.data.roles_number;
                    // self.building_types=response.data.building_types;

                    console.log(self.using_types);
                })
                .catch(function (error) {
                    console.log(error);
                });
        },

        nextStep() {
            this.$validator.validateAll().then((result) => {
                //  alert(result)
                if (result == true) {
                    this.$emit('next', this.project);
                } else {
                    this.$refs.form.validate();
                }
            });
        },
        fillEditData(data,isEdit) {
            const self = this;
           self.project = data;
           self.isEdit=isEdit;
                // self.buiding_type=data.buiding_type;
                // self.role_number=data.buiding_type;
                // self.unit_number=data.buiding_type;
                // self.build_rate=data.buiding_type;
                // self.using=data.buiding_type;
                // self.name=data.buiding_type;
                // self.billing_type=data.buiding_type;
                // self.total_rate=data.buiding_type;
                // self.authorization_request_number=data.buiding_type;
                // self.license_number=data.buiding_type;
                // //  type_of_request:'',
                // self.plot_number=data.buiding_type;
                // self.cadastral_decision_number=data.buiding_type;
                // self.start_date=data.buiding_type;
                // self.end_date=data.buiding_type;
                // // customer_id:null,
                // self.users_id=data.buiding_type;
                // self.description=data.buiding_type;
                // self.lead_id=data.buiding_type;
                // self.status=data.buiding_type;
                // self.id=data.buiding_type;
                
             
 
            self.project.users_id=data.members.map(({ id }) => id);
           
        },
    },
};
</script>