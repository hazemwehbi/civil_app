
<template>
    <v-container grid-list-md>
        <Mapp
            @fillCordinate="fillCordinate1($event)"
            ref="mapref"
            :lat="location.lat"
            :lon="location.lon"
        />
        <v-layout row>
            <v-flex xs12 sm12>
                <v-card class="elevation-3">
                    <v-card-title primary-title xs8 sm8>
                        <div>
                            <div class="headline">
                                {{ trans('data.location_info') }}
                            </div>
                        </div>
                    </v-card-title>
                    <v-divider></v-divider>
                    <v-card-text>
                        <v-container grid-list-md>
                            <v-layout row wrap>
                                <v-flex md3>
                                    <v-select
                                        item-text="value"
                                        item-value="key"
                                        :items="province_municipalities"
                                        v-model="location.province_municipality"
                                        :label="trans('data.province_municipality')"
                                        :data-vv-as="trans('data.province_municipality')"
                                        :error-messages="errors.collect('province_municipality')"
                                         :disabled="isEdit"
                                    ></v-select>
                                </v-flex>
                                <v-flex md3>
                                    <v-select
                                        item-text="value"
                                        item-value="key"
                                        :items="municipalities"
                                        v-model="location.municipality"
                                        :label="trans('data.municipality')"
                                        :data-vv-name="location.municipality"
                                        :data-vv-as="trans('data.municipality')"
                                        :error-messages="errors.collect('municipality')"
                                         :disabled="isEdit"
                                    ></v-select>
                                </v-flex>

                                <v-flex md3>
                                    <v-select
                                        item-text="value"
                                        item-value="key"
                                        :items="categories_location"
                                        v-model="location.category"
                                        :label="trans('data.category')"
                                        :data-vv-name="location.category"
                                        :data-vv-as="trans('data.category')"
                                        :error-messages="errors.collect('category')"
                                         :disabled="isEdit"
                                    ></v-select>
                                </v-flex>

                                <v-flex md3>
                                    <v-select
                                        item-text="value"
                                        item-value="key"
                                        :items="neighborhoods"
                                        v-model="location.neighborhood"
                                        :label="trans('data.neighborhood')"
                                        :data-vv-name="location.neighborhood"
                                        :data-vv-as="trans('data.neighborhood')"
                                        :error-messages="errors.collect('neighborhood')"
                                        :disabled="isEdit"
                                    ></v-select>
                                </v-flex>

                                <v-flex md3>
                                    <v-select
                                        item-text="value"
                                        item-value="key"
                                        :items="districts"
                                        v-model="location.district"
                                        :label="trans('data.district')"
                                        :data-vv-name="location.district"
                                        :data-vv-as="trans('data.district')"
                                        :error-messages="errors.collect('district')"
                                      :disabled="isEdit"
                                    ></v-select>
                                </v-flex>

                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.plan_id"
                                        :label="trans('data.plan_id')"
                                           :disabled="isEdit"
                                    ></v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.piece_number"
                                        :label="trans('data.piece_number')"
                                         :disabled="isEdit"
                                    ></v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.size_number"
                                        type="number"
                                        :label="trans('data.size_number')"
                                         :disabled="isEdit"
                                    >
                                    </v-text-field>
                                </v-flex>
                            </v-layout>

                            <v-layout row wrap>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.northern_border"
                                        :label="trans('data.northern_border')"
                                        :disabled="isEdit"
                                    >
                                    </v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.eastern_border"
                                        :label="trans('data.eastern_border')"
                                        :disabled="isEdit"
                                    >
                                    </v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.western_border"
                                        :label="trans('data.western_border')"
                                        :disabled="isEdit"
                                    ></v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.southern_border"
                                        :label="trans('data.southern_border')"
                                        :disabled="isEdit"
                                    ></v-text-field>
                                </v-flex>
                            </v-layout>
                            <v-layout row wrap>
                                <v-flex md3>
                                    <v-autocomplete
                                        item-text="value"
                                        item-value="key"
                                        :items="statuses"
                                        v-model="location.status"
                                        :label="trans('data.location_status')"
                                        :disabled="isEdit"
                                    ></v-autocomplete>
                                </v-flex>

                                <v-flex md3>
                                    <v-menu
                                        v-model="menu1"
                                        :close-on-content-click="false"
                                        max-width="290"
                                    >
                                        <template v-slot:activator="{ on, attrs }">
                                            <v-text-field
                                                :value="computedDateFormattedMomentjs"
                                                clearable
                                                :label="trans('data.instrument_date')"
                                                readonly
                                                    :disabled="isEdit"
                                                v-bind="attrs"
                                                v-on="on"
                                                @click:clear="location.instrument_date = null"
                                            ></v-text-field>
                                        </template>
                                        <v-date-picker
                                            v-model="location.instrument_date"
                                            @change="menu1 = false"
                                        ></v-date-picker>
                                    </v-menu>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.instrument_number"
                                        :label="trans('data.instrument_number')"
                                            :disabled="isEdit"
                                    ></v-text-field>
                                </v-flex>

                                <v-flex md3>
                                    <!-- <div class="v-input v-text-field theme--light">
                                        <div class="v-input__control">
                                            <div class="v-input__slot">
                                                <div class="v-text-field__slot">
                                                    <label
                                                        style="font-size: 22px"
                                                        aria-hidden="true"
                                                        class="
                                                            v-label v-label--active
                                                            theme--light
                                                            flat_picker_label
                                                        "
                                                    >
                                                        {{ trans('data.instrument_date') }}
                                                    </label>
                                                    <flat-pickr
                                                    :readonly="isEdit"
                                                        v-model="location.instrument_date"
                                                        name="instrument_date"
                                                        required
                                                        :config="flatPickerDate()"
                                                        :data-vv-as="trans('data.instrument_date')"
                                                    ></flat-pickr>
                                                </div>
                                            </div>
                                            <div class="v-messages theme--light error--text">
                                                {{ errors.first('instrument_date') }}
                                            </div>
                                        </div>
                                    </div> -->
                                </v-flex>
                            </v-layout>
                            <v-layout row wrap>
                                <v-flex md4>
                                    <v-text-field
                                        :disabled="isEdit"
                                        v-model="location.lon"
                                        :label="trans('data.lon')"
                                    ></v-text-field>
                                </v-flex>

                                <v-flex md4>
                                    <v-text-field
                                     :disabled="isEdit"
                                        v-model="location.lat"
                                        :label="trans('data.lat')"
                                    ></v-text-field>
                                </v-flex>
                                <v-flex md3 v-if="!isEdit">
                                    <v-btn
                                        @click="createcordinate"
                                        large
                                        
                                        dark
                                        style="background-color: #06706d; color: white"
                                    >
                                        {{ trans('data.locate_map') }}

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
import Mapp from './Mapp.vue';
import moment from 'moment';
import { format, parseISO } from 'date-fns';
export default {
    components: {
        Mapp,
    },

    props: {
        customerId: String,
    },
    data() {
        // https://github.com/date-fns/date-fns/blob/master/docs/upgradeGuide.md#string-arguments

        return {
            date: null, //new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
            // .toISOString()
            //.substr(0, 10),
            menu: false,
            modal: false,
            menu1: false,
            menu2: false,
            isEdit: false,
            province_municipalities: [],
            municipalities: [],
            categories_location: [],
            neighborhoods: [],
            districts: [],
            location: {
                province_municipality: '',
                municipality: '',
                category: '',
                neighborhood: '',
                district: '',
                plan_id: '',
                piece_number: '',
                size_number: '',
                instrument_number: '',
                instrument_date: '',
                northern_border: '',
                eastern_border: '',
                western_border: '',
                southern_border: '',
                status: '',
                lon: '',
                lat: '',
                id: '',
            },
            statuses: [],
        };
    },
    created() {
        const self = this;
        // console.log(self.location1)
        self.getLocationStatus();
        self.getLocationInfo();
    },
    computed: {
        computedDateFormattedMomentjs() {
            const self = this;
            return self.location.instrument_date;
            // ? moment(self.location.instrument_date).format('dddd, MMMM Do YYYY')
            // : '';
        },
        computedDateFormattedDatefns() {
            const self = this;
            return self.location.instrument_date;
            // ? format(parseISO(self.location.instrument_date), 'EEEE, MMMM do yyyy')
            //  : '';
        },
    },
    methods: {
        getLocationStatus() {
            const self = this;
            axios
                .get('/get-location-status')
                .then(function (response) {
                    self.statuses = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },

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
        fillCordinate1(data) {
            const self = this;
            self.location.lon = data.lon;
            self.location.lat = data.lat;
        },
        nextStep() {
            const self = this;
            console.log(self.location);
            //  alert(JSON.stringify(self.location))
            this.$emit('next', this.location);
        },

        createcordinate() {
            const self = this;

            this.$refs.mapref.create(self.location);
        },
        fillEditData(data, isEdit) {
            const self = this;
            self.isEdit = isEdit;

            self.location = data;

            console.log(self.location);
        },
    },
};
</script>