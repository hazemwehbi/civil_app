<template>
    <div class="component-wrap">
        <v-container grid-list-md>
            <v-stepper v-model="e1" alt-labels>
                <v-stepper-header>
                    <v-stepper-step :complete="e1 > 1" step="1" color="teal">
                        {{ trans('data.customer_info') }}
                    </v-stepper-step>

                    <v-divider></v-divider>

                    <v-stepper-step step="2" :complete="e1 > 2" color="teal">
                        {{ trans('data.location_info') }}
                    </v-stepper-step>

                    <v-divider></v-divider>

                    <v-stepper-step step="3" :complete="e1 > 3" color="teal">
                        {{ trans('data.project_info') }}
                    </v-stepper-step>
                </v-stepper-header>

                <v-stepper-items>
                    <v-stepper-content step="1">
                        <CustomerInfo
                            @next="getCustomerData($event)"
                            ref="customerInfo"
                            @click="getCustomerInfo"
                        />
                        <v-layout row justify-center>
                            <v-btn color="teal" small outline @click="$router.go(-1)">
                                {{ trans('messages.back') }}
                            </v-btn>
                            <div style="display: flex" align="right">
                                <v-btn
                                    style="background-color: #06706d; color: white"
                                    small
                                    @click="getCustomerInfo"
                                >
                                    {{ trans('messages.next') }}
                                </v-btn>
                            </div>
                        </v-layout>
                    </v-stepper-content>

                    <v-stepper-content step="2">
                        <LocationInfo @next="getLocationData($event)" ref="locationInfo" />
                        <v-layout row pt-3 justify-center>
                            <v-btn color="teal" small outline @click="e1 = 1">
                                {{ trans('messages.back') }}
                            </v-btn>
                            <div style="display: flex" align="right">
                                <v-btn
                                    style="background-color: #06706d; color: white"
                                    small
                                    @click="getLocationInfo"
                                >
                                    {{ trans('messages.next') }}
                                </v-btn>
                            </div>
                        </v-layout>
                    </v-stepper-content>

                    <v-stepper-content step="3">
                        <ProjectInfo @next="getProjectData($event)" ref="projectInfo" />
                        <v-layout row pt-3 justify-center>
                            <v-btn color="teal" small outline @click="e1 = 2">
                                {{ trans('messages.back') }}
                            </v-btn>
                            <div style="display: flex" align="right">
                                <v-btn
                                    style="background-color: #06706d; color: white"
                                    :loading="loading"
                                    :disabled="loading"
                                    small
                                    v-show="!isEdit"
                                    @click="getProjectInfo"
                                >
                                    {{ trans('messages.save') }}
                                </v-btn>
                            </div>
                        </v-layout>
                    </v-stepper-content>
                </v-stepper-items>
            </v-stepper>
        </v-container>
    </div>
</template>

<script>
import VueTelInputVuetify from 'vue-tel-input-vuetify';
import CustomerInfo from './project_info/customerInfo.vue';
import LocationInfo from './project_info/locationInfo.vue';
import ProjectInfo from './project_info/ProjectInfo.vue';
import Popover from '../../../admin/popover/Popover';
export default {
    components: {
        CustomerInfo,
        LocationInfo,
        ProjectInfo,
        Popover,
    },
    data() {
        const self = this;
        return {
            e1: 1,
            project_id: '',
            customers: [],
            location: new Object(),
            project: new Object(),
            agency_id: null,
            users_id: [],
            loading: false,
            isEdit: false,
        };
    },
    mounted() {},

    created() {
        const self = this;
    },
    methods: {
        goTo(step, can, data) {},
        getCustomerData(data) {
            this.customers = data.customers;
            this.agency_id = data.agency_id;
            this.e1 = 2;
        },
        getLocationData(data) {
            this.location = data;
            this.e1 = 3;
        },
        getProjectData(data) {
            this.project = data;
            this.users_id = data.users_id;
            delete this.project.users_id;
            this.store();
        },
        getCustomerInfo() {
            this.$refs.customerInfo.nextStep();
        },
        getLocationInfo() {
            this.$refs.locationInfo.nextStep();
        },
        getProjectInfo() {
            this.$refs.projectInfo.nextStep();
        },
        store(val) {
            const self = this;
            let data = {
                project: self.project,
                location: self.location,
                customers: self.customers,
                users_id: self.users_id,
                agency_id: self.agency_id,
            };
            this.loading = true;
            axios
                .post('/add-new-project', data)
                .then(function (response) {
                    self.loading = false;
                    self.$store.commit('showSnackbar', {
                        message: response.data.msg,
                        color: response.data.success,
                    });
                    self.$router.push({ path: '/project' });
                    if (response.data.success) {
                        // self.loading=false;
                        //   self.dialog = false;
                        self.$eventBus.$emit('updateTicketsTable');

                        //   self.goBack();
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
    },
};
</script>
 

