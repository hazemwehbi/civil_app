<template>
        <v-card  :class="$vuetify.breakpoint.xsOnly?'pt-4':''">
            <v-form ref="form" v-model="valid" lazy-validation>
                <v-card-title>
                    <v-icon medium>person</v-icon>
                    <span class="headline">
                        {{ trans('data.edit_employee') }}
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
                                    :error-messages="errors.collect('name')"
                                    required
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.email')"
                                    v-model="email"
                                    v-validate="'required|email'"
                                    :rules="[
                                        (v) =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('messages.email'),
                                            }),
                                        (v) => /.+@.+\..+/.test(v) || trans('messages.email_valid'),
                                    ]"
                                    :data-vv-as="trans('messages.email')"
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
                                                name: trans('data.id_card_number'),
                                            }),
                                    ]"
                                    type="number"
                                    :label="trans('data.id_card_number')"
                                  autocomplete="new-password"
                                ></v-text-field>
                            </v-flex>
   <v-flex xs12 sm6>
                                                 <v-text-field
            v-model="password"
            :append-icon="show1 ? 'visibility' : 'visibility_off'"
            :type="show1 ? 'text' : 'password'"
            name="input-10-1"
            autocomplete="new-password"
           :label="trans('messages.password')"
            hint="At least 6 characters"
            counter
            @click:append="show1 = !show1"
          ></v-text-field>
        </v-flex>
                           <!-- <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.password')"
                                    :messages="trans('messages.password_edit_help')"
                                    type="password"
                                      autocomplete="new-password"
                                    v-model="password"
                                    :rules="[
                                        (v) => (v) =>
                                            (v && v.length >= 6) ||
                                            trans('messages.string_length', {
                                                name: trans('messages.password'),
                                                length: '6',
                                            }),
                                        ,
                                    ]"
                            
                                ></v-text-field>
                            </v-flex>-->
                            <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.confirm_password')"
                                    type="password"
                                    v-model="passwordConfirm"
                                    :rules="[
                                        (v) =>
                                            !(v != password && password.length > 0) ||
                                            trans('messages.password_not_match'),
                                    ]"
                                    
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
                                    ></v-autocomplete>
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
                                >
                                </v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6 md4>
                                <v-text-field
                                    type="number"
                                    v-model="form_fields.alternate_num"
                                    :label="trans('messages.alternate_num')"
                                >
                                </v-text-field>
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
                          
                            <v-flex xs12 sm12 md12>
                                 <v-textarea
                                    v-model="form_fields.current_address"
                                    no-resize
                                    clearable
                                    @keypress="textAreaWrite"
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
                                                        v-label
                                                        theme--light
                                                        w-full
                                                        text-start
                                                        flat_picker_label
                                                    "
                               
                                                    :class="label_active"
                                                    style="left:auto"
                                                >
                                                    {{ trans('messages.date_of_birth') }}
                                                </label>
                                                <flat-pickr
                                                    v-model="birth_date"
                                                    name="date_of_birth"
                                                      @input="label_active = 'v-label--active'"
                                                    :config="flatPickerDate()"
                                                ></flat-pickr>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                                     no-resize
                                    clearable
                                    @keypress="textAreaWrite"
                                >
                                </v-textarea>
                            </v-flex>
                            <!-- <v-flex xs12 sm6>
                                <v-autocomplete
                                    multiple
                                    :validate-on-blur="false"
                                    :persistent-placeholder="false"
                                    :chips="true"
                                    item-text="name"
                                    item-value="id"
                                    :items="roles"
                                    v-model="form_fields.role_ids"
                                   :rules="[
                                        (v) =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('messages.role'),
                                            }),
                                    ]"
                                    :label="trans('messages.role')"
                                    required
                                ></v-autocomplete>
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
                    <v-card-actions class="flex-wrap">
                        <v-spacer></v-spacer>
                        <v-btn color="error" class="mr-4" @click="reset">
                            {{ trans('data.reset') }}
                        </v-btn>
                        <v-btn @click="save()" color="primary" :disabled="!valid || !checkActive()">
                            {{ trans('messages.update') }}
                        </v-btn>

                        <v-btn style="color: #06706d" @click="$router.go(-1)">
                            {{ trans('data.cancel') }}
                        </v-btn>
                    </v-card-actions>
                </v-layout>
            </v-form>
        </v-card>
</template>

<script>
import Popover from '../../../admin/popover/Popover';
export default {
    components: {
        Popover,
    },
    props: {
        propUserId: {
            required: true,
        },
    },
    data() {
        const self = this;

        return {
            show1: false,
            valid: true,
            name: '',
            form_fields: [],
            birth_date: null,
            label_active:"",
            gender_types: [],
            email: '',
            password: '',
            active: '',
                 province_municipalities: [],
            location_data:"",
            // enginnering_types: [],
            id_card_number: '',
            send_email: false,
            is_edit_role: false,
            //  enginnering_type: 'it_enginnering',
        };
    },
    mounted() {
        const self = this;
        // self.getEnginneringTypes();
        self.checkCurrentUserType();
        // this.loadUser(() => {});
    },
    created() {
        this.loadUser(() => {});
         this.getLocationInfo()
    },
    methods: {
        save() {
            const self = this;
            if (this.$refs.form.validate()) {
                let payload = {
                    name: self.name,
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

                    gender: self.form_fields.gender,
                    note: self.form_fields.note,
                    email: self.email,
                    password: self.password ? self.password : null,
                    active: self.active ? moment().format('YYYY-MM-DD') : null,
                    // role: self.form_fields.role_ids,
                    send_email: self.send_email,
                    account_holder_name: self.form_fields.account_holder_name,
                    account_no: self.form_fields.account_no,
                    bank_name: self.form_fields.bank_name,
                    bank_identifier_code: self.form_fields.bank_identifier_code,
                    branch_location: self.form_fields.branch_location,
                    tax_payer_id: self.form_fields.tax_payer_id,
                    id_card_number: self.id_card_number,
                    // enginnering_type: self.enginnering_type,
                };

                self.$store.commit('showLoader');
                axios
                    .put('/estate_owner/users/' + self.propUserId, payload)
                    .then(function (response) {
                        self.$store.commit('showSnackbar', {
                            message: response.data.msg,
                            color: response.data.success,
                        });

                        self.$store.commit('hideLoader');

                        if (response.data.success === true) {
                            self.goBack();
                        }
                    })
                    .catch(function (error) {
                        self.$store.commit('hideLoader');

                        if (error.response) {
                            self.$store.commit('showSnackbar', {
                                message: error.response.data.message,
                                color: 'error',
                                duration: 3000,
                            });
                        } else if (error.request) {
                            console.log(error.request);
                        } else {
                            console.log('Error', error.message);
                        }
                    });
            } else {
                self.$store.commit('showSnackbar', {
                    message: 'املئ الحقول الضرورية',
                    color: 'error',
                    duration: 3000,
                });
            }
        },
        loadUser(cb) {
            const self = this;
            //  alert(self.propUserId)
            axios.get('/estate_owner/users/' + self.propUserId + '/edit').then(function (response) {
                let User = response.data.user;
                self.form_fields = User;
                self.gender_types = response.data.gender_types;
                self.birth_date = User.birth_date;
                self.location_data = User.location_data;
                self.name = User.name;
                self.email = User.email;
                self.id_card_number = User.id_card_number;
                self.active = User.active !== null;
                // self.roles = response.data.roles;
                // self.form_fields.role_ids = response.data.role_ids;
                self.checkRolePrimary(self.propUserId);
                // self.enginnering_type = JSON.parse(User.enginnering_type).toString();
                //  alert(JSON.parse(User.enginnering_type));
                //   self.is_edit_role = response.data.is_edit_role;
            });
        },
        checkRolePrimary(id) {
            const self = this;
            //  alert(self.propUserId)
            axios.get('/check-role-primary/' + id).then(function (response) {
                // self.is_edit_role = response.data.is_edit_role==0 ? false : true;
                //  alert(response.data==0 )
                self.is_edit_role = response.data == 0 ? false : true;
            });
        },
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },
    },
};
</script>
