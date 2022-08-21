<template>
    <div>
        <v-card>
             <SignaturePad ref="signature" @save="signature = $event"/>
            <v-card-title>
                <v-icon medium>person</v-icon>
                <span class="headline">
                    {{ trans('data.edit_employee') }}
                </span>
            </v-card-title>
            <v-divider></v-divider>
            <v-card-text>
                <v-container grid-list-md>
                    <v-form
                        ref="form"
                        v-model="valid"
                        lazy-validation
                        enctype="multipart/form-data"
                    >
                        <v-layout row wrap>
                            <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.name')"
                                    v-model="name"
                                    :rules="[
                                        v =>
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
                                        v =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('messages.email'),
                                            }),
                                        v => /.+@.+\..+/.test(v) || trans('messages.email_valid'),
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
                                        v =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('data.id_card_number'),
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
                                    :messages="trans('messages.password_edit_help')"
                                    type="password"
                                    autocomplete="new-password"
                                    v-model="password"
                                    :rules="[
                                        v => v =>
                                            (v && v.length >= 6) ||
                                            trans('messages.string_length', {
                                                name: trans('messages.password'),
                                                length: '6',
                                            }),
                                        ,
                                    ]"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.confirm_password')"
                                    type="password"
                                    autocomplete="off"
                                    v-model="passwordConfirm"
                                    :rules="[
                                        v =>
                                            !(v != password && password.length > 0) ||
                                            trans('messages.password_not_match'),
                                    ]"
                                ></v-text-field>
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
                            <v-flex xs12 sm6 md6>
                                <v-textarea
                                    v-model="form_fields.home_address"
                                    :label="trans('messages.home_address')"
                                    rows="3"
                                >
                                </v-textarea>
                            </v-flex>
                            <v-flex xs12 sm6 md6>
                                <v-textarea
                                    v-model="form_fields.current_address"
                                    :label="trans('messages.current_address')"
                                    rows="3"
                                >
                                </v-textarea>
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
                            <v-flex xs12 sm6>
                                <v-autocomplete
                                    multiple
                                    :validate-on-blur="false"
                                    :persistent-placeholder="false"
                                    :chips="true"
                                    item-text="name"
                                    item-value="id"
                                     @change="changeRole"
                                    :items="roles"
                                    v-model="form_fields.role_ids"
                                    :rules="[
                                        v =>
                                            !!v ||
                                            trans('messages.required', {
                                                name: trans('messages.role'),
                                            }),
                                    ]"
                                    :label="trans('messages.role')"
                                    required
                                ></v-autocomplete>
                            </v-flex>
                            <v-flex
                                xs12
                                sm3
                                v-if="form_fields.role_ids && form_fields.role_ids.find(val => val === 2) === 2"
                            >
                                <v-text-field
                                    v-model="title"
                                    :label="trans('messages.title')"
                                    :rules="[
                                        v =>
                                            (v && v.length > 0) ||
                                            trans('messages.required', {
                                                name: trans('messages.role'),
                                            }),
                                    ]"
                                    required
                                ></v-text-field>
                            </v-flex>
                            <v-flex
                                xs12
                                sm3
                                class="text-xs-center text-sm-center text-md-center text-lg-center"
                                v-if="form_fields.role_ids && 
                                        form_fields.role_ids.find(val => val == 2)
                                "
                            >
                                <!-- Here the image preview -->
                                <img :src="logo?logo:imageUrl" height="150" v-if="imageUrl || logo" />
                                <v-text-field
                                    label="Select Image"
                                    @click="pickFile"
                                    v-model="imageName"
                                    prepend-icon="mdi-file-image"
                                ></v-text-field>
                                <input
                                    type="file"
                                    style="display: none"
                                    ref="image"
                                    :src="office.image"
                                    accept="image/jpeg, image/jpg, image/png"
                                    @change="onFilePicked"
                                />
                            </v-flex>
                            <v-flex
                                xs12
                                sm3
                                class="text-xs-center text-sm-center text-md-center text-lg-center"
                            >
                                <!-- Here the image preview -->
                                <img :src="signature?signature:signatureUrl" height="150" />
                            </v-flex>
                            <v-flex xs12 sm3 v-if="$hasRole('superadmin')">
                                <v-switch
                                    :label="trans('messages.pre_Active_acount')"
                                    v-model="active"
                                ></v-switch>
                            </v-flex>
                            <v-flex xs12 sm3>
                                <v-checkbox
                                    :label="trans('messages.send_email')"
                                    value="true"
                                    v-model="send_email"
                                >
                                </v-checkbox>
                            </v-flex>
                        </v-layout>
                    </v-form>
                </v-container>
            </v-card-text>
            <v-layout justify-center>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn @click="save()" color="primary" dark>
                        {{ trans('messages.update') }}
                    </v-btn>
                     <v-btn color="secondary" class="mr-4" @click="$refs.signature.dialog = true">
                            {{ trans('data.addSignature') }}
                        </v-btn>
                    <v-btn style="color: #06706d" @click="$router.go(-1)">
                        {{ trans('data.cancel') }}
                    </v-btn>
                </v-card-actions>
            </v-layout>
        </v-card>
    </div>
</template>

<script>
import Popover from '../../popover/Popover';
import SignaturePad from './SignaturePad'
export default {
    components: {
        Popover,
        SignaturePad
    },
    props: {
        propUserId: {
            required: true,
        },
    },
    data() {
        const self = this;

        return {
            valid: false,
            name: '',
            form_fields: [],
            birth_date: null,
            gender_types: [],
            passwordConfirm: null,
            email: '',
            password: '',
            active: '',
            roles: [],
            title: null,
            id_card_number: '',
            send_email: false,
            office: [],
            imageUrl: '',
            imageFile: null,
            imageName: '',
            signature: null,
            logo:null,
            signatureUrl: null
        };
    },
    mounted() {
        const self = this;
    },
    created() {
        this.loadUser(() => {});
    },
    methods: {
          changeRole(){
          this.$forceUpdate()
        },
        pickFile() {
            this.$refs.image.click();
        },
        onFilePicked(e) {
            const files = e.target.files;
            if (files[0] !== undefined) {
                this.imageName = files[0].name;
                if (this.imageName.lastIndexOf('.') <= 0) {
                    return;
                }
                const fr = new FileReader();
                fr.readAsDataURL(files[0]);
                fr.addEventListener('load', () => {
                    this.logo = fr.result;
                    this.imageFile = files[0];
                });
            } else {
                this.imageName = '';
                this.imageFile = '';
                this.logo = '';
            }
        },
        save() {
            const self = this;

            if (this.$refs.form.validate()) {
                let payload = {
                    signature: self.signature,
                    name: self.name,
                    mobile: self.form_fields.mobile,
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
                    email: self.email,
                    password: self.password ? self.password : null,
                    active: self.active ? moment().format('YYYY-MM-DD') : null,
                    role: self.form_fields.role_ids,
                    send_email: self.send_email,
                    account_holder_name: self.form_fields.account_holder_name,
                    account_no: self.form_fields.account_no,
                    bank_name: self.form_fields.bank_name,
                    bank_identifier_code: self.form_fields.bank_identifier_code,
                    branch_location: self.form_fields.branch_location,
                    tax_payer_id: self.form_fields.tax_payer_id,
                    id_card_number: self.id_card_number,
                    title: self.title,
                    file: self.logo
                };
                self.$store.commit('showLoader');
                axios
                    .put('/admin/users/' + self.propUserId, payload )
                    .then(function(response) {
                        self.$store.commit('showSnackbar', {
                            message: response.data.msg,
                            color: response.data.success,
                        });

                        self.$store.commit('hideLoader');

                        if (response.data.success === true) {
                            self.goBack();
                        }
                    })
                    .catch(function(error) {
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
            axios.get('/admin/users/' + self.propUserId + '/edit').then(function(response) {
                let User = response.data.user;
                self.form_fields = User;
                self.gender_types = response.data.gender_types;
                self.birth_date = User.birth_date;
                self.name = User.name;
                self.email = User.email;
                self.id_card_number = User.id_card_number;
                self.active = User.active !== null;
                self.roles = response.data.roles;
                self.form_fields.role_ids = response.data.role_ids;
                self.title = response.data.user.title;
                self.signatureUrl = response.data.user.signature;
                self.imageUrl = response.data.user.logo
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
