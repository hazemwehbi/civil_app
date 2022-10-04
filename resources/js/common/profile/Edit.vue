<template>
        <v-card :class="$vuetify.breakpoint.xsOnly?'pt-4':''">
             <SignaturePad ref="signature" @save="signature = $event"/>
            <v-form ref="form" v-model="valid" lazy-validation>
                <v-card-title>
                    <v-icon medium>person</v-icon>
                    <span class="headline">
                        {{ trans('messages.edit_profile') }}
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
                            <v-flex xs12 sm6 md4>
                                    <v-autocomplete
                                        item-text="value"
                                        item-value="key"
                                        :items="province_municipalities"
                                        v-model="location_data"
                                        :label="trans('data.province_municipality')"
                                        v-validate="'required'"
                                      
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
                                    required
                                ></v-text-field>
                            </v-flex>

                            <v-flex xs12 sm6>
                                <v-text-field
                                    :label="trans('messages.password')"
                                    :messages="trans('messages.password_edit_help')"
                                    type="password"
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
                                    required
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 sm6>
                                       <v-text-field
                                    :label="trans('messages.confirm_password')"
                                    type="password"
                                    autocomplete="off"
                                    v-model="passwordConfirm?passwordConfirm:password"
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
                              <v-flex 
                               v-if="$hasRole('Engineering Office Manager')"
                              xs12 sm12 md12>
                                <v-textarea
                               
                                    rows="3"
                                    v-model="form_fields.title"
                                    :label="trans('data.title')"
                                >
                                </v-textarea>
                            </v-flex>
                              <v-flex
                                xs12
                                sm3
                                class="text-xs-center text-sm-center text-md-center text-lg-center"
                            >
                                <!-- Here the image preview -->
                                <img :src="signature?signature:signatureUrl" height="150" />
                            </v-flex>
                             <v-flex
                                v-if="$hasRole('Engineering Office Manager')"
                                xs12
                                sm3
                                class="text-xs-center text-sm-center text-md-center text-lg-center"
                            >
                                <!-- Here the image preview -->
                                <div class="img-container" @click="pickFile">
                                <img :src="logo?logo:imageUrl" height="150" v-if="imageUrl || logo"  class="image"/>
                                <div class="overlay">Click For Select Image</div>
                                </div>
                                <v-text-field
                                    v-if="!logo"
                                    label="Select Image"
                                    @click="pickFile"
                                    v-model="imageName"
                                    prepend-icon="mdi-file-image"
                                ></v-text-field>
                                <input
                                    type="file"
                                    style="display: none"
                                    ref="image"
                                    accept="image/jpeg, image/jpg, image/png"
                                    @change="onFilePicked"
                                />
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

                            <!-- <v-flex xs12 sm3>
                                <v-checkbox
                                    :label="trans('messages.send_email')"
                                    value="true"
                                    v-model="send_email"
                                >
                                </v-checkbox>
                            </v-flex> -->
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
                       <v-btn color="secondary" class="mr-4" @click="$refs.signature.dialog = true">
                            {{ trans('data.addSignature') }}
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
import SignaturePad from '../../admin/users/components/SignaturePad'
import Popover from '../../admin/popover/Popover';
export default {
    components:{
SignaturePad,
Popover
    },
    data() {
        const self = this;

        return {
            valid: true,
            name: '',
            form_fields: [],
            birth_date: null,
            gender_types: [],
            email: '',
            password: '',
            active: '',
            id_card_number: '',
            send_email: false,
                 province_municipalities: [],
            location_data:"",
            is_edit_role: false,
                  signature: null,
            signatureUrl: null,
            passwordConfirm: null,
              imageUrl: '',
            imageFile: null,
            imageName: '',
            signature: null,
            logo:null,
        };
    },
    created() {
        const self = this;
        self.userId = self.$route.params.id;
        self.getLocationInfo()
        self.edit(self.userId);
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
        edit(userId) {
            const self = this;
            self.$validator.reset();
            axios
                .get('/manage-profiles/' + userId + '/edit')
                .then(function (response) {
                    let User = response.data.user;
                    self.form_fields = User;
                    self.gender_types = response.data.gender_types;
                    self.birth_date = User.birth_date;
                    self.name = User.name;
                    self.email = User.email;
                    self.location_data= User.location_data,
                    self.id_card_number = User.id_card_number;
                    self.active = User.active !== null;
                    self.signatureUrl = response.data.user.signature;
                       self.imageUrl = response.data.user.logo
                    // self.roles = response.data.roles;
                    // self.form_fields.role_ids = response.data.role_ids;
                    self.checkRolePrimary(self.propUserId);
                    // self.enginnering_type = JSON.parse(User.enginnering_type).toString();
                    //  alert(JSON.parse(User.enginnering_type));
                    //   self.is_edit_role = response.data.is_edit_role;
                    self.initDropzone();
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        initDropzone() {
            const self = this;
            if (self.dropzone) {
                self.dropzone.destroy();
            }
            self.dropzone = new Dropzone('div#fileUploadEdit', {
                url: APP.APP_URL + '/media',
                paramName: 'file',
                maxFilesize: APP.UPLOAD_FILE_MAX_SIZE,
                uploadMultiple: true,
                maxFiles: 1,
                acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
                dictDefaultMessage: self.trans('messages.drop_image_here'),
                headers: { 'X-CSRF-TOKEN': _token },
                autoProcessQueue: true,
                init: function () {
                    var prevFile;
                    this.on('addedfile', function () {
                        if (typeof prevFile !== 'undefined') {
                            this.removeFile(prevFile);
                        }
                    });
                    this.on('success', function (file, response) {
                        prevFile = file;
                    });
                },
                success: function (file, response) {
                    if (response.success == true) {
                        self.form_fields.media = response.file_name;
                    }
                },
            });
        },
           reset() {
            this.$refs.form.reset();
        },
              save() {
            const self = this;
            if (this.$refs.form.validate()) {
                let payload = {
                    signature: self.signature,
                    file: self.logo,
                    name: self.name,
                    mobile: self.form_fields.mobile,
                    alternate_num: self.form_fields.alternate_num,
                    home_address: self.form_fields.home_address,
                    current_address: self.form_fields.current_address,
                    skype: self.form_fields.skype,
                    linkedin: self.form_fields.linkedin,
                    location_data: self.location_data,
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
                    title: self.form_fields.title,
                    bank_identifier_code: self.form_fields.bank_identifier_code,
                    branch_location: self.form_fields.branch_location,
                    tax_payer_id: self.form_fields.tax_payer_id,
                    id_card_number: self.id_card_number,
                };

                self.$store.commit('showLoader');
                axios
                   // .put('/admin/users/' + self.propUserId, payload)
                    .put('/manage-profiles/' + self.getCurrentUser().id, payload)
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
        store() {
            const self = this;
            let data = _.pick(self.form_fields, [
                'name',
                'email',
                'mobile',
                'alternate_num',
                'skype',
                'linkedin',
                'facebook',
                'twitter',
                'gender',
                'home_address',
                'current_address',
                'guardian_name',
                'gender',
                'media',
            ]);

            data.birth_date = self.birth_date;
            data.password = self.password;

            self.$validator.validateAll().then((result) => {
                if (result == true) {
                    self.loading = true;
                    axios
                        .put('/manage-profiles/' + self.userId, data)
                        .then(function (response) {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                            self.loading = false;
                            if (response.data.success === true) {
                                self.goBack();
                            }
                        })
                        .catch(function (error) {
                            if (error.response) {
                                self.$store.commit('showSnackbar', {
                                    message: error.response.data.message,
                                    color: 'error',
                                });
                            }
                        });
                }
            });
        },
    },
};
</script>
<style scoped>
.img-container {
  position: relative;
  max-width: 300px;
  cursor: pointer;
}

.image {
  display: block;
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute; 
  bottom: 0; 
  background: rgb(0, 0, 0);
  background: rgba(0, 0, 0, 0.5); /* Black see-through */
  color: #f1f1f1; 
  width: 100%;
  transition: .5s ease;
  opacity:0;
  color: white;
  font-size: 20px;
  padding: 20px;
  text-align: center;
}
.img-container:hover .overlay {
  opacity: 1;
}
</style>