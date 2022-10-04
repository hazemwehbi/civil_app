<template>
        <v-card  :class="$vuetify.breakpoint.xsOnly?'pt-4':''">
            <SignaturePad ref="signature" @save="signatureData = $event"/>
            <v-form ref="form" v-model="valid" lazy-validation>
                <v-card-title>
                    <v-icon medium>person</v-icon>
                    <span class="headline">
                        {{ trans('data.add_employee_off') }}
                    </span>
                </v-card-title>
                <v-divider></v-divider>
                <v-card-text>
                    <v-container grid-list-md>
                        <v-layout row wrap>
                            <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.name')"
                                    v-model="name"
                                    :rules="[
                                        (v) =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('messages.name'),
                                            }),
                                    ]"
                                    :data-vv-as="trans('messages.name')"
                                    :error-messages="errors.collect('name')"
                                    required
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.email')"
                                    v-model="email"
                                    :rules="[
                                        (v) =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('messages.name'),
                                            }),
                                        (v) => /.+@.+\..+/.test(v) || trans('messages.email_valid'),
                                    ]"
                                    :error-messages="errors.collect('email')"
                                    required
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm12>
                                <v-text-field
                                    v-model="id_card_number"
                                    :rules="[
                                        (v) =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('messages.name'),
                                            }),
                                    ]"
                                    type="number"
                                   
                                    :label="trans('data.id_card_number')"
                                    required
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.password')"
                                    type="password"
                                     autocomplete="new-password"
                                    v-model="password"
                                    :rules="[
                                        (v) =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('messages.password'),
                                            }),
                                        ,
                                        (v) =>
                                            (v && v.length >= 6) ||
                                            trans('messages.string_length', {
                                                name: trans('messages.password'),
                                                length: '6',
                                            }),
                                        ,
                                    ]"
                                    required
                                ></v-text-field>
                            </v-flex>
                            
                            <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.confirm_password')"
                                    type="password"
                                    v-model="passwordConfirm"
                                    :rules="[
                                        (v) =>
                                            !(v !== password) ||
                                            trans('messages.password_not_match'),
                                    ]"
                                    required
                                ></v-text-field>
                            </v-flex>
                             <v-flex xs12 sm6 md4>
                                    <v-autocomplete
                                        item-text="value"
                                        item-value="key"
                                        :items="province_municipalities"
                                        v-model="location_data"
                                        :label="trans('data.province_municipality')"
                                        :data-vv-as="trans('data.province_municipality')"
                                        :error-messages="errors.collect('province_municipality')"
                                                  :rules="[
                                        (v) =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('data.province_municipality'),
                                            }),
                                    ]"
                                    required
                                    ></v-autocomplete>
                                </v-flex>
                               <v-flex xs12 sm12 md12 >

                                <v-autocomplete
                              
                                    item-text="value"
                                    :clearable="true"
                                    :deletable-chips="true"
                                    :dense="true"
                                    search-input=""
                                    :solo-inverted="false"
                                    :eager="true"
                                    :loading="false"
                                    :validate-on-blur="false"
                                    :persistent-placeholder="false"
                                    chips="true"
                                    item-value="key"
                                    :items="enginnering_types"
                                    v-model="specialty_id"
                                    :label="trans('data.enginnering_type')"
                                    :rules="[
                                        (v) =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('data.enginnering_type'),
                                            }),
                                    ]"
                                    required
                                >
                                    <!-- <Popover
                                    slot="append"
                                    :helptext="trans('messages.project_member_tooltip')"
                                >
                                </Popover> -->
                                </v-autocomplete>
                            </v-flex>
                          

                            <!-- communication details -->
                            <v-flex xs12 sm12 md12>
                                <v-icon small>contact_mail</v-icon>
                                <span class="subheading">
                                    {{ trans('messages.communication_details') }}
                                </span>
                                <v-divider class="mb-2 mt-1"></v-divider>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    type="number"
                                    v-model="form_fields.mobile"
                                    :label="trans('messages.mobile')"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    type="number"
                                    v-model="form_fields.alternate_num"
                                    :label="trans('messages.alternate_num')"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.skype"
                                    :label="trans('messages.skype')"
                                >
                                </v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.linkedin"
                                    :label="trans('messages.linkedin')"
                                >
                                </v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.facebook"
                                    :label="trans('messages.facebook')"
                                >
                                </v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.twitter"
                                    :label="trans('messages.twitter')"
                                >
                                </v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md6>
                                <v-textarea
                                    v-model="form_fields.home_address"
                                    :label="trans('messages.home_address')"
                                    rows="3"
                                ></v-textarea>
                            </v-flex>
                            <v-flex xs12 sm6 md6>
                                <v-textarea
                                    v-model="form_fields.current_address"
                                    :label="trans('messages.current_address')"
                                    rows="3"
                                ></v-textarea>
                            </v-flex>
                            <!-- personal information -->
                            <v-flex xs12 sm12 md12>
                                <v-icon small>contact_phone</v-icon>
                                <span class="subheading">
                                    {{ trans('messages.personal_details') }}
                                </span>
                                <v-divider class="mb-2 mt-1"></v-divider>
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
                                                    {{ trans('messages.date_of_birth') }}
                                                </label>
                                                <flat-pickr
                                                    v-model="birth_date"
                                                    name="date_of_birth"
                                                    :config="flatPickerDate()"
                                                ></flat-pickr>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.guardian_name"
                                    :label="trans('messages.guardian_name')"
                                >
                                </v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-select
                                    :items="gender_types"
                                    v-model="form_fields.gender"
                                    :label="trans('messages.gender')"
                                ></v-select>
                            </v-flex>
                            <!-- bank details -->
                            <v-flex xs12 sm12 md12>
                                <v-icon small> account_balance_wallet </v-icon>
                                <span class="subheading">
                                    {{ trans('data.bank_details') }}
                                </span>
                                <v-divider class="mb-2 mt-1"></v-divider>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.account_holder_name"
                                    :label="trans('data.account_holder_name')"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    type="number"
                                    v-model="form_fields.account_no"
                                    :label="trans('data.account_no')"
                                >
                                </v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.bank_name"
                                    :label="trans('data.bank_name')"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.bank_identifier_code"
                                    :label="trans('data.bank_identifier_code')"
                                >
                                    <Popover
                                        slot="append"
                                        :helptext="trans('data.tooltip_bank_identifier_code')"
                                    >
                                    </Popover>
                                </v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.branch_location"
                                    :label="trans('data.branch_location')"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    v-model="form_fields.tax_payer_id"
                                    :label="trans('data.tax_payer_id')"
                                >
                                    <Popover
                                        slot="append"
                                        :helptext="trans('messages.tooltip_tax_payer_id')"
                                    >
                                    </Popover>
                                </v-text-field>
                            </v-flex>
                            <v-flex xs12 sm12 md12>
                                <v-textarea
                                    rows="3"
                                    v-model="form_fields.note"
                                    :label="trans('messages.note')"
                                >
                                </v-textarea>
                            </v-flex>
                            <v-flex xs12 sm3>
                                <v-autocomplete
                                   class="content-sign"
                                    multiple
                                    :clearable="true"
                                    :deletable-chips="true"
                                    :dense="true"
                                    search-input=""
                                    :solo-inverted="false"
                                    :eager="true"
                                    :loading="false"
                                    :validate-on-blur="false"
                                    :persistent-placeholder="false"
                                    item-text="name"
                                    item-value="id"
                                    :items="roles"
                                    v-model="form_fields.role_id"
                                    :label="trans('messages.role')"
                                    :rules="[
                                        (v) =>
                                            (v && v.length > 0) ||
                                            trans('messages.required', {
                                                name: trans('messages.role'),
                                            }),
                                    ]"
                                    required
                                ></v-autocomplete>
                            </v-flex>
                            <!-- <v-flex xs12 sm3 v-if="$hasRole('superadmin')">
                                <v-switch
                                    :label="trans('messages.pre_Active_acount')"
                                    v-model="active"
                                ></v-switch>
                            </v-flex> -->
                            <v-flex xs12 sm3>
                                <v-checkbox
                                    :label="trans('messages.send_email')"
                                    value="true"
                                    v-model="send_email"
                                >
                                </v-checkbox>
                            </v-flex>
                        </v-layout>
                    </v-container>
                </v-card-text>
                <v-layout justify-center>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="error" class="mr-4" @click="reset">
                            {{ trans('data.reset') }}
                        </v-btn>
                        <v-btn
                            @click="save()"
                            :disabled="!valid || !checkActive()"
                            color="success"
                            class="mr-4"
                        >
                            {{ trans('messages.save') }}
                        </v-btn>
                          <v-btn color="secondary" class="mr-4" @click="$refs.signature.dialog = true">
                            {{ trans('data.addSignature') }}
                        </v-btn>
                        <v-btn style="color: #06706d" @click="$router.go(-1)">
                            {{ trans('messages.back') }}
                        </v-btn>
                    </v-card-actions>
                </v-layout>
            </v-form>
        </v-card>
</template>

<script>
import Popover from '../../../admin/popover/Popover';
import SignaturePad from '../../../admin/users/components/SignaturePad'
export default {
    components: {
        Popover,
        SignaturePad
    },
    data() {
        const self = this;

        return {
            enginnering_types: [],
            valid: true,
            name: '',
            form_fields: [],
            birth_date: null,
            gender_types: [],
            province_municipalities: [],
            location_data:"",
            email: '',
            id_card_number: '',
            password: '',
            swordConfirm: '',
            specialty_id:null,
            active: true,
            roles: [],
            send_email: false,
            enginnering_type: '',
            signatureData: null
        };
    },
    mounted() {
        const self = this;
        self.loadRolesAndGenders();
        self.getEnginneringTypes();
        this.getLocationInfo();
        self.$store.commit('setBreadcrumbs', [
            { label: 'Users', name: 'users.list' },
            { label: 'Create', name: '' },
        ]);
    },
    methods: {
            getLocationInfo() {
            const self = this;
            axios
                .get('/get-location-info')
                .then(function (response) {
                    self.province_municipalities = response.data.provinceMunicipalities;
                    self.municipalities = response.data.municipalities;
                    self.categories_location = response.data.categoriesLocation;
                    self.neighborhoods = response.data.neighborhoods;
                    self.districts = response.data.districts;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        getEnginneringTypes() {
            const self = this;
            axios
                .get('/get-enginnering-types')
                .then(function (response) {
                    self.enginnering_types = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        save() {
            const self = this;

            if (this.$refs.form.validate()) {
                let payload = {
                    signature: self.signatureData,
                    name: self.name,
                    email: self.email,
                    mobile: self.form_fields.mobile,
                    location_data: self.location_data,
                    alternate_num: self.form_fields.alternate_num,
                    home_address: self.form_fields.home_address,
                    current_address: self.form_fields.current_address,
                    skype: self.form_fields.skype,
                    linkedin: self.form_fields.linkedin,
                    facebook: self.form_fields.facebook,
                    twitter: self.form_fields.twitter,
                    birth_date: self.birth_date,
                    guardian_name: self.form_fields.guardian_name,
                    gender: self.form_fields.gender,
                    note: self.form_fields.note,
                    password: self.password,
                    active: moment().format('YYYY-MM-DD'), //self.active ? moment().format('YYYY-MM-DD') : null,
                    role: self.form_fields.role_id,
                    send_email: self.send_email,
                    account_holder_name: self.form_fields.account_holder_name,
                    account_no: self.form_fields.account_no,
                    bank_name: self.form_fields.bank_name,
                    bank_identifier_code: self.form_fields.bank_identifier_code,
                    branch_location: self.form_fields.branch_location,
                    tax_payer_id: self.form_fields.tax_payer_id,
                    id_card_number: self.id_card_number,
                    specialty_id: self.specialty_id,
                };

                self.$store.commit('showLoader');
                axios
                    .post('/enginner_office/users', payload)
                    .then(function (response) {
                       /// console.log(response.data.msg)
                          // alert(JSON.stringify(response.data.msg.error))
                        self.$store.commit('showSnackbar', {
                            message: response.data.msg,
                            color: response.data.success,
                        });

                        self.$store.commit('hideLoader');
                      //  self.reset();
                     //   self.resetValidation();
                        if (response.data.success === true) {
                            // reset
                            self.reset();
                        self.resetValidation();
                            self.$validator.reset();
                            self.goBack();
                        }
                    })
                    .catch(function (error) {
                        self.$store.commit('hideLoader');
                        alert(JSON.stringify(error.response.data.message))
                        self.$store.commit('showSnackbar', {
                            message: error.response,
                            color: 'error',
                            duration: 50000,
                        });
                        // if (error.response) {
                        //     console.log(error.response.data.message);
                        //     self.$store.commit('showSnackbar', {
                        //         message: error.response.data.message.error,
                        //         color: 'error',
                        //         duration: 3000,
                        //     });
                        // } else if (error.request) {
                        //     console.log(error.request);
                        // } else {
                        //     console.log('Error', error.message);
                        // }
                    });
            } else {
                self.$store.commit('showSnackbar', {
                    message: 'املئ الحقول الضرورية',
                    color: 'error',
                    duration: 3000,
                });
            }
        },

        reset() {
            //  this.$refs.observer.reset();
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },
        loadRolesAndGenders() {
            const self = this;
            axios
                .get('/enginner_office/users/create')
                .then(function (response) {
                    self.gender_types = response.data.gender_types;
                    self.roles = response.data.roles;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
    },
};
</script>
