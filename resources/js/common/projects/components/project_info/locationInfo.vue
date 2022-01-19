
<template>
    <v-container grid-list-md>
       <Mapp  @fillCordinate="fillCordinate1($event)" ref="mapref" />
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
                                    <v-text-field
                                        v-model="location.province_municipality"
                                        :label="trans('data.province_municipality')"
                                        :readonly="isEdit"
                                    >
                                    </v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.municipality"
                                        :label="trans('data.municipality')"
                                        :readonly="isEdit"
                                    ></v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.plan_id"
                                        type="number"
                                        :label="trans('data.plan_id')"
                                        :readonly="isEdit"
                                    ></v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.piece_number"
                                        type="number"
                                        :label="trans('data.piece_number')"
                                        :readonly="isEdit"
                                    ></v-text-field>
                                </v-flex>
                            </v-layout>

                            <v-layout row wrap>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.size_number"
                                        type="number"
                                        :label="trans('data.size_number')"
                                        :readonly="isEdit"
                                    >
                                    </v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.instrument_number"
                                        type="number"
                                        :label="trans('data.instrument_number')"
                                        :readonly="isEdit"
                                    ></v-text-field>
                                </v-flex>

                                <v-flex md3>
                                    <div class="v-input v-text-field theme--light">
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
                                    </div>
                                </v-flex>

                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.northern_border"
                                        :label="trans('data.northern_border')"
                                        :readonly="isEdit"
                                    >
                                    </v-text-field>
                                </v-flex>
                            </v-layout>

                            <v-layout row wrap>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.eastern_border"
                                        :label="trans('data.eastern_border')"
                                        :readonly="isEdit"
                                    >
                                    </v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.western_border"
                                        :label="trans('data.western_border')"
                                        :readonly="isEdit"
                                    ></v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.southern_border"
                                        :label="trans('data.southern_border')"
                                        :readonly="isEdit"
                                    ></v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-autocomplete
                                        item-text="value"
                                        item-value="key"
                                        :items="statuses"
                                        v-model="location.status"
                                        :label="trans('messages.status')"
                                        :readonly="isEdit"
                                    ></v-autocomplete>
                                </v-flex>
                            </v-layout>

                            <v-layout row wrap>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.lon"
                                        :label="trans('data.lon')"
                                        type="number"
                                        :readonly="isEdit"

                                    ></v-text-field>
                                </v-flex>
                                <v-flex md3>
                                    <v-text-field
                                        v-model="location.lat"
                                        :label="trans('data.lat')"
                                        type="number"
                                        :readonly="isEdit"
                                    ></v-text-field>
                                </v-flex>
                                <v-flex xs1 sm1 md1>
                                    <v-btn
                                        @click="createcordinate"
                                        small
                                        v-show="!isEdit"
                                        fab
                                        dark
                                        style="background-color: #06706d; color: white"
                                    >
                                        <v-icon>add</v-icon>
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
import Mapp from  './Mapp.vue'
export default {

    props: ['customerId'],
    data() {
        return {
            isEdit:false,
            location: {
                province_municipality: '',
                municipality: '',
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
                id:'',
                
            },
            statuses: [],
        };
    },
 
    created() {
        const self = this;
        self.getLocationStatus();
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
        fillCordinate1(data) {
            const self = this;
            self.location.lon = data.lon;
            self.location.lat = data.lat;
        },
        nextStep() {
            this.$emit('next', this.location);
        },

        createcordinate() {
            this.$refs.mapref.create();
        },
         fillEditData(data,isEdit) {
             const self = this;
             self.isEdit=isEdit;
            
            self.location=data;

         
        },
    },
};
</script>