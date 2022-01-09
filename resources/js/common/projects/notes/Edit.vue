
<style scoped>
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0, 0, 0, 0.125);
    border-radius: 0.5rem;
}
.card > hr {
    margin-right: 0;
    margin-left: 0;
}
.card > .list-group {
    border-top: inherit;
    border-bottom: inherit;
}
.card > .list-group:first-child {
    border-top-width: 0;
    border-top-left-radius: calc(0.25rem - 1px);
    border-top-right-radius: calc(0.25rem - 1px);
}
.card > .list-group:last-child {
    border-bottom-width: 0;
    border-bottom-right-radius: calc(0.25rem - 1px);
    border-bottom-left-radius: calc(0.25rem - 1px);
}
.card > .card-header + .list-group,
.card > .list-group + .card-footer {
    border-top: 0;
}

.card-body {
    flex: 1 1 auto;
    padding: 1rem 1rem;
    background-color: rgba(217, 217, 217, 255);
}

.card-title {
    margin-bottom: 0.5rem;
}

.card-subtitle {
    margin-top: -0.25rem;
    margin-bottom: 0;
}

.card-text:last-child {
    margin-bottom: 0;
}

.card-link + .card-link {
    margin-left: 1rem;
}

.card-header {
    padding: 0.5rem 1rem;
    margin-bottom: 0;
    background-color: rgba(12, 111, 109, 255);
    border-bottom: 1px solid rgba(0, 0, 0, 0.125);
    color: white;
}
.card-header:first-child {
    border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0;
}

.card-footer {
    padding: 0.5rem 1rem;
    background-color: rgba(0, 0, 0, 0.03);
    border-top: 1px solid rgba(0, 0, 0, 0.125);
}
.card-footer:last-child {
    border-radius: 0 0 calc(0.25rem - 1px) calc(0.25rem - 1px);
}

.card-header-tabs {
    margin-right: -0.5rem;
    margin-bottom: -0.5rem;
    margin-left: -0.5rem;
    border-bottom: 0;
}
.card-text {
    text-align: -webkit-center;
}

.card-header-pills {
    margin-right: -0.5rem;
    margin-left: -0.5rem;
}

.card-img-overlay {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    padding: 1rem;
    border-radius: calc(0.25rem - 1px);
}

.card-img,
.card-img-top,
.card-img-bottom {
    width: 100%;
}

.card-img,
.card-img-top {
    border-top-left-radius: calc(0.25rem - 1px);
    border-top-right-radius: calc(0.25rem - 1px);
}

.card-img,
.card-img-bottom {
    border-bottom-right-radius: calc(0.25rem - 1px);
    border-bottom-left-radius: calc(0.25rem - 1px);
}

.card-group > .card {
    margin-bottom: 0.75rem;
}
@media (min-width: 576px) {
    .card-group {
        display: flex;
        flex-flow: row wrap;
    }
    .card-group > .card {
        flex: 1 0 0%;
        margin-bottom: 0;
    }
    .card-group > .card + .card {
        margin-left: 0;
        border-left: 0;
    }
    .card-group > .card:not(:last-child) {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }
    .card-group > .card:not(:last-child) .card-img-top,
    .card-group > .card:not(:last-child) .card-header {
        border-top-right-radius: 0;
    }
    .card-group > .card:not(:last-child) .card-img-bottom,
    .card-group > .card:not(:last-child) .card-footer {
        border-bottom-right-radius: 0;
    }
    .card-group > .card:not(:first-child) {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }
    .card-group > .card:not(:first-child) .card-img-top,
    .card-group > .card:not(:first-child) .card-header {
        border-top-left-radius: 0;
    }
    .card-group > .card:not(:first-child) .card-img-bottom,
    .card-group > .card:not(:first-child) .card-footer {
        border-bottom-left-radius: 0;
    }
}
</style>
<template id="panel-template">
    <v-container  justify-center>
                
                     <v-card-actions justify-left>
                 
                    <v-btn style="color: #06706d" @click="$router.go(-1)">
                        {{ trans('messages.back') }}
                    </v-btn>
                    <v-btn
                        style="background-color: #06706d; color: white"
                        color="darken-1"
                        @click="update"
                        :loading="loading"
                        :disabled="loading"
                    >
                        {{ trans('data.update') }}
                    </v-btn>
                </v-card-actions>
               <v-spacer></v-spacer>
        <v-card id="printMe" onafterprint="myFunction()">
            <v-divider></v-divider>
            <v-card-text >
                <v-container grid-list-md >
                    <v-layout row wrap>
                        <v-flex xs12 sm6 md6>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.name_report')"
                                    header-tag="header1"
                                    title=""
                                > 
                                    <v-text-field
                                         id="input_name"
                                        v-model="report.name"
                                        v-validate="'required'"
                                        data-vv-name="name"
                                        :data-vv-as="trans('messages.name')"
                                        :error-messages="errors.collect('name')"
                                        required
                                    >
                                    </v-text-field>
                                </b-card>
                            </b-card-group>
                        </v-flex>

                        <v-flex xs12 sm6 md6>
                            <b-card-group deck >
                                <b-card
                                    :header="trans('data.create_time') "
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text  >{{ report.created_at }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>
                    <v-layout row wrap>
                        <v-flex xs12 sm12 md12>
                              <b-card-group deck>
                                <b-card
                                    :header="trans('data.decription_report') "
                                    header-tag="header1"
                                    title=""
                                >
                                    <quill-editor v-model="report.description"> </quill-editor>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>
                    

                    <v-layout row>
                        <v-flex xs12 sm12 md12>
                            <v-autocomplete
                                id="input_report_type"
                                 :readonly="true"
                                item-text="value"
                                item-value="key"
                                :items="report_types"
                                v-model="report.type"
                                :label="trans('data.report_type')"
                                v-validate="'required'"
                                @change="(event) => enableReport(event)"
                                data-vv-name="report_type"
                                :data-vv-as="trans('data.report_type')"
                                :error-messages="errors.collect('report_type')"
                                required
                               
                            ></v-autocomplete>
                        </v-flex>
                    </v-layout>
                <v-container v-if="enable_report">
                 <v-container >
                 <h1> {{ trans('data.customer_info') }}</h1>
                  <v-layout  >
                                         <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.owner_name')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.customer.name }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.id_card_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.customer.id_card_number }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.email')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.customer.email }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.mobile')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.customer.mobile }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        </v-layout >
                        </v-container >


                         <v-container >
                 <h1> {{ trans('data.agency_info') }}</h1>
                          <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.trade_name')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.agency.trade_name }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.record_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.agency.record_number }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.email')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.agency.email }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.mobile')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.agency.mobile }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout >
                 </v-container>



                 
                
                <v-container >
                 <h1> {{ trans('data.location_info') }}</h1>
                          <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.province_municipality')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.province_municipality }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.municipality')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.municipality }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.plan_numer')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.plan_id }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.plan_numer')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.plan_id}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>

                     <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.land_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.piece_number }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.size_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.size_number }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.instrument_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.instrument_number }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.instrument_date')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.instrument_date}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>



                     <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.northern_border')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.northern_border}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.eastern_border')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{project.location.eastern_border}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.western_border')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{project.location.western_border}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.southern_border')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.southern_border}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>



                     <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.northern_border')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.northern_border }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.eastern_border')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.eastern_border }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.western_border')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.western_border }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.southern_border')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.southern_border}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>




                     <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.status')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ trans('messages.'+project.location.status) }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.lon')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.lon }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.lat')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.lat }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.southern_border')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.location.southern_border}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>

                </v-container>




                <v-container >
                 <h1>    {{ trans('data.project_info') }}</h1>
                      <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.name')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.name }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.status')"
                                    header-tag="header1"
                                    title=""
                                >
                               
                                    <b-card-text> {{ trans('messages.'+project.status) }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.start_date')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.start_date }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.members')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{getFields(project.members,'name') }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>


                      
                      <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('messages.end_date')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.end_date }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.authorization_request_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.authorization_request_number }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.license_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.license_number }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.plot_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.plot_number}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>


                      
                      <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.cadastral_decision_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.cadastral_decision_number}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.buiding_type')"
                                    header-tag="header1"
                                    title=""
                                >
                                
                                    <b-card-text>{{ trans('data.'+project.buiding_type) }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.unit_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.unit_number }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                           <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.build_rate')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.build_rate}}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                    </v-layout>


                     
                      <v-layout >
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.billing_type')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ trans('messages.'+project.billing_type) }} </b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.role_number')"
                                    header-tag="header1"
                                    title=""
                                >
                                    <b-card-text>{{ project.role_number }}</b-card-text>
                                </b-card>
                            </b-card-group>
                        </v-flex>
                        <v-flex xs12 sm3 md3>
                            <b-card-group deck>
                                <b-card
                                    :header="trans('data.using')"
                                    header-tag="header1"
                                    title=""
                                >
                               
                                    <b-card-text> {{ trans('data.'+project.using) }}</b-card-text>
                                </b-card>
                            </b-card-group>
                             </v-flex>
                    </v-layout>
                     </v-container>


               </v-container>
               </v-container>
            </v-card-text>
        </v-card>
    </v-container>
</template>
<script>

export default {

    data() {
        return {
            type: 'testt',
            project: {},
            report:{},
            project_id: '',
            description: '',
            name:'',
            report_types: [],
            report_type: '',
            create_time:'',
            enable_report:true,
        };
    },
    created() {
        const self = this;
        self.reset();
        self.getReportTypes();
        self.create_time=self.currentDateTime();
                console.log(self.$route.params.project)
      //  self.project = self.$route.params.project;
        self.report = self.$route.params.report;
        console.log(self.report);
        console.log(self.report);
        self.get_project_info(self.report.project_id);
      //  self.project_id =self.$route.params.project.id;
    },
    beforeDestroy() {
        const self = this;
    },
    mounted: function() {
    },
    methods: {

         getFields(input, field) {
            var output = [];
            
            for (var i=0; i < input.length ; ++i)
                output.push(input[i][field]);
            return output.join("&&");
        },
        getReportTypes() {
            const self = this;
            axios
                .get('/get-report-types')
                .then(function (response) {
                    self.report_types = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
   
     
        get_project_info(project_id){
            const self = this;
            self.project_id = project_id;
            self.$validator.reset();
            axios
                .get('get-project_info/' + project_id )
                .then(function(response) {
                    console.log(response);
                    self.project = response.data;
                   
                })
                .catch(function(error) {
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
            // self.request_types=[];
        },

       
        currentDateTime() {
                const current = new Date();
                const date = current.getFullYear()+'-'+(current.getMonth()+1)+'-'+current.getDate();
                const time = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
                const dateTime = date +' '+ time;
                return dateTime;
       },
        update() {
            const self = this;
           
            let data = {
                name:self.report.name,
                description: self.report.description,
                project_id:self.report.project_id,
                type:self.report.type,
              //  id:self.report.id
            };
            self.$validator.validateAll().then((result) => {
                if (result == true) {
                    self.loading = true;
                    axios
                    .put('/reports/' + self.report.id, data)
                        .then(function (response) {
                           // self.loading = false;
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                            if (response.data.success === true) {
                             
                                self.goBack();
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
                }
            });
            //self.reset();

          
        },
        print () {
             const self = this;
             self.$validator.validateAll().then((result) => {
             if (result == true) {
                // Pass the element id here
                document.getElementById("input_name").setAttribute('value',this.name);
                document.getElementById("input_report_type").setAttribute('value',"Kick Of Project");
                
                //alert(this.report_type)
                    // Get HTML to print from element
                const prtHtml = document.getElementById('printMe').innerHTML;

                // Get all stylesheets HTML
                let stylesHtml = '';
                for (const node of [...document.querySelectorAll('link[rel="stylesheet"], style')]) {
                stylesHtml += node.outerHTML;
                }
                stylesHtml += "<style type=\"text/css\">.v-icon {\n  display: none;\n}}\n</style>";
                //

                    // Open the print window
                    const WinPrint = window.open('', '', 'left=0,top=0,width=1020,height=900,toolbar=0,scrollbars=0,status=0');
  
                    WinPrint.document.write(`<!DOCTYPE html>
                    <html>
                    <head>
                        ${stylesHtml}
                        
                    </head>
                    <body>
                        ${prtHtml}
                    </body>
                    </html>`);
            
                        //  await this.$htmlToPaper('printMe');
                    WinPrint.document.close();
                   
                    WinPrint.focus();
                       
                    WinPrint.print();
                    WinPrint.close();
                   this.store();

             }
             });
         
        },

        enableReport(value){
            const self=this;
            self.enable_report=true;
        }
          
    },
};
</script>
