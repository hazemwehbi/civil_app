<template>
    <div>
        <v-toolbar color="cyan" dark tabs height="28">
            <v-toolbar-title>{{ project.name }}</v-toolbar-title>
            <template slot="extension">
                <v-tabs
                    centered
                    color="cyan"
                    slider-color="yellow"
                    v-model="tabs"
                    dark
                    icons-and-text
                    height="50"
                >
                    <!-- tab menu -->
                    <v-tab href="#tab-1" @click="projectOverview">
                        {{ trans('messages.overview') }}
                        <v-icon>dvr</v-icon>
                    </v-tab>

                    <v-tab href="#tab-2" @click="projectLocation">
                        {{ trans('data.location_info') }}
                        <v-icon>timeline</v-icon>
                    </v-tab>
                    <v-tab href="#tab-3" @click="projectLocation">
                        {{ trans('data.customer_info') }}
                        <v-icon>timeline</v-icon>
                    </v-tab>

                    <v-tab href="#tab-4" @click="projectActivities">
                        {{ trans('messages.activities') }}
                        <v-icon>timeline</v-icon>
                    </v-tab>

                    <v-tab href="#tab-5" @click="tasks">
                        {{ trans('messages.tasks') }}
                        <v-icon>assignment</v-icon>
                    </v-tab>

                    <v-tab href="#tab-6">
                        {{ trans('data.visit_request') }}
                        <v-icon>assignment</v-icon>
                    </v-tab>
                     <v-tab href="#tab-7">
                        {{ trans('data.public_bills') }}
                        <v-icon>assignment</v-icon>
                    </v-tab>
                    <v-tab href="#tab-8">
                        {{ trans('data.document_info') }}
                        <v-icon>perm_media</v-icon>
                    </v-tab>

                    <!-- /tab menu-->
                </v-tabs>
            </template>
        </v-toolbar>

        <!-- tab content -->
        <v-tabs-items v-model="tabs">
            <v-tab-item :key="1" :value="'tab-1'">
                <v-card flat>
                    <v-card-text>
                        <ProjectInfo ref="projectInfo" compo_type="view" />

                        <!-- <ProjectOverview ref="projectOverview"> </ProjectOverview> -->
                    </v-card-text>
                </v-card>
            </v-tab-item>

            <v-tab-item :key="2" :value="'tab-2'">
                <v-card flat>
                    <v-card-text>
                        <LocationInfo ref="locationInfo" />
                    </v-card-text>
                </v-card>
            </v-tab-item>
            <v-tab-item :key="3" :value="'tab-3'">
                <v-card flat>
                    <v-card-text>
                        <CustomerInfo
                            @next="getCustomerData($event)"
                            ref="customerInfo"
                        />
                    </v-card-text>
                </v-card>
            </v-tab-item>

            <v-tab-item :key="4" :value="'tab-4'">
                <v-card flat>
                    <v-card-text>
                        <ProjectActivity ref="projectActivity"> </ProjectActivity>
                    </v-card-text>
                </v-card>
            </v-tab-item>

            <v-tab-item :key="5" :value="'tab-5'">
                <v-card flat>
                    <v-card-text> <TaskLists></TaskLists> </v-card-text>
                </v-card>
            </v-tab-item>
            <v-tab-item :key="6" :value="'tab-6'">
                <v-card flat>
                    <v-card-text> <visitRequests :id="projectId" ></visitRequests> </v-card-text>
                </v-card>
            </v-tab-item>
              <v-tab-item :key="7" :value="'tab-7'">
                <v-card flat>
                    <v-card-text> <visitInvoices :id="projectId" ></visitInvoices> </v-card-text>
                </v-card>
            </v-tab-item>
            <v-tab-item :key="8" :value="'tab-8'">
                <v-card flat>
                    <v-card-text>
                        <Document ref="documentsInfo" :media="media"> </Document>
                    </v-card-text>
                </v-card>
            </v-tab-item>
        </v-tabs-items>
        <!-- /tab content -->
        <v-layout justify-center>
            <v-card-actions jusi>
                <v-spacer></v-spacer>
                <v-btn style="color: #06706d" @click="$router.go(-1)">
                    {{ trans('messages.back') }}
                </v-btn>
            </v-card-actions>
        </v-layout>
    </div>
</template>
<script>
import TaskLists from '../tasks/List';
import MilestonesLists from '../milestones/Lists';
import ProjectOverview from '../overview/ProjectOverview';
import ProjectActivity from '../activities/ProjectActivity';
import InvoiceLists from '../invoices/Lists';
import NotesAndDocumentsList from '../notes/Lists';
import visitRequests from '../../tickets/List.vue';

import visitInvoices from '../invoices/Lists.vue';

import VueTelInputVuetify from 'vue-tel-input-vuetify';
import CustomerInfo from './project_info/customerInfo.vue';
import LocationInfo from './project_info/locationInfo.vue';
import ProjectInfo from './project_info/ProjectInfo.vue';
import Document from './project_info/documnets.vue';
import Popover from '../../../admin/popover/Popover';

export default {
    components: {
        TaskLists,
        MilestonesLists,
        ProjectOverview,
        ProjectActivity,
        InvoiceLists,
        NotesAndDocumentsList,
        Document,
        CustomerInfo,
        LocationInfo,
        ProjectInfo,
        Popover,
        visitRequests,
        visitInvoices
    },
    props: {
        propProjectId: {
            required: true,
        },
    },
    data() {
        return {
            projectId: null,
            project: [],
            tabs: 'tab-1',
            media: null
        };
    },
    created() {
        const self = this;
        self.projectId = self.$route.params.id;
        self.loadProject();
        self.$store.commit('drawer', {
            drawer: false,
        });
    },
    methods: {
        loadProject() {
            const self = this;

            axios.get('projects/' + self.propProjectId).then(function (response) {
                console.log(response)
                if (!response.data.error_code) {
                    self.$refs.customerInfo.fillEditData(
                        response.data.data.project.customer,
                        response.data.data.project.agency,
                        true
                    );
                    self.media =  response.data.data.project.media
                    //  alert(JSON.stringify(response.data.data.project))
                    self.$refs.locationInfo.fillEditData(response.data.data.project.location, true);
                    // this.$refs.projectInfo.fillEditData();
                    self.$refs.projectInfo.fillEditData(response.data.data.project, true);

                    self.$refs.documentsInfo.fillEditData(response.data.data.media, false);
                } else {
                    self.$store.commit('hideLoader');
                    self.$store.commit('showSnackbar', {
                        message: response.data.error_description,
                        color: 'red',
                    });
                }
            });
        },
        projectOverview() {
            const self = this;
            self.$refs.projectInfo.fillEditData(response.data.data.project, true);
            //self.$refs.projectOverview.getProjectOverviewFromApi(self.projectId);
        },
        projectLocation() {
            const self = this;
            // self.$refs.projectActivity.getProjectActivities();
        },
        projectActivities() {
            const self = this;
            self.$refs.projectActivity.getProjectActivities();
        },
        tasks() {
            const self = this;
            self.$eventBus.$emit('updateTaskTable', self.propProjectId);
        },
        // documentAndNotes() {
        //     const self = this;
        //     self.$refs.documents.getProjectDocumets();
        // },
        milestones() {
            const self = this;
            self.$refs.milestone.getMilestoneList();
        },
        invoice() {
            const self = this;
            self.$refs.invoice.getInvoiceFromApi();
        },
        getProject(project_id) {
            const self = this;
            axios
                .get('/projects/' + project_id + '/customer')
                .then(function (response) {
                    self.project = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
    },
};
</script>
