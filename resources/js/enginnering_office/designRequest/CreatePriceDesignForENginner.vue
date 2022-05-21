
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>

<template id="panel-template">
    <v-container justify-center>
        <v-form ref="form" v-model="valid" lazy-validation>
            <v-card-actions justify-left>
                <v-btn style="color: #06706d" @click="$router.go(-1)">
                    {{ trans('messages.back') }}
                </v-btn>

                <v-btn
                    v-if="false"
                    style="background-color: #06706d; color: white"
                    color="darken-1"
                    @click="generatePDF"
                >
                    {{ trans('data.generate_pdf') }}
                </v-btn>

                <v-btn
                    v-if="design_enginner.is_sent == 0"
                    style="background-color: #06706d; color: white"
                    color="darken-1"
                    @click="send"
                    :loading="loading"
                    :disabled="!valid || !checkActive()"
                >
                    {{ trans('data.send') }}
                </v-btn>
            </v-card-actions>
            <v-spacer></v-spacer>
            <v-card id="printMe" onafterprint="myFunction()">
                <v-divider></v-divider>
                <v-card-text>
                    <v-container grid-list-md>
                        <v-layout row wrap>
                            <v-flex xs12 sm4 md4>
                                <b-card-group deck>
                                    <b-card
                                        :header="trans('data.enginner_name')"
                                        header-tag="header1"
                                        title=""
                                    >
                                        <b-card-text>{{ enginner_name }}</b-card-text>
                                    </b-card>
                                </b-card-group>
                            </v-flex>
                            <v-flex xs12 sm4 md4>
                                <b-card-group deck>
                                    <b-card
                                        :header="trans('data.create_time')"
                                        header-tag="header1"
                                        title=""
                                    >
                                        <b-card-text>{{ create_time }}</b-card-text>
                                    </b-card>
                                </b-card-group>
                            </v-flex>
                            <v-flex xs12 sm4 md4>
                                <b-card-group deck>
                                    <b-card
                                        :header="trans('data.stage')"
                                        header-tag="header1"
                                        title=""
                                    >
                                        <b-card-text>{{ stage_name }}</b-card-text>
                                    </b-card>
                                </b-card-group>
                            </v-flex>
                        </v-layout>
                        <v-layout row wrap>
                            <v-flex xs12 sm12 md12>
                                <b-card-group deck>
                                    <b-card
                                        :header="trans('data.price')"
                                        header-tag="header1"
                                        title=""
                                    >
                                        <vuetify-money
                                            v-model="price"
                                            v-bind:label="label"
                                            v-bind:placeholder="placeholder"
                                            v-bind:readonly="readonly"
                                            v-bind:disabled="disabled"
                                            v-bind:outlined="outlined"
                                            v-bind:clearable="clearable"
                                            v-bind:valueWhenIsEmpty="valueWhenIsEmpty"
                                            v-bind:options="options"
                                            v-bind:properties="properties"
                                            required
                                            :rules="[
                                                (v) =>
                                                    !!v ||
                                                    trans('messages.required', {
                                                        name: trans('data.price'),
                                                    }),
                                            ]"
                                        />

                                        <!-- <v-text-field
                                        id="input_name"
                                        v-model="price"
                                        v-validate="'required'"
                                        data-vv-name="name"
                                        hide-details
                                        single-line
                                        type="number"
                                        :data-vv-as="trans('messages.name')"
                                        :error-messages="errors.collect('name')"
                                        required
                                    >
                                    </v-text-field> -->
                                    </b-card>
                                </b-card-group>
                            </v-flex>
                        </v-layout>

                        <!-- <v-layout row>
                        <v-flex xs12 sm12 md12>
                            <v-autocomplete
                                id="input_report_type"
                                item-text="value"
                                item-value="key"
                                :items="report_types"
                                v-model="report_type"
                                :label="trans('data.report_type')"
                                v-validate="'required'"
                                @change="(event) => enableReport(event)"
                                data-vv-name="report_type"
                                :data-vv-as="trans('data.report_type')"
                                :error-messages="errors.collect('report_type')"
                                required
                            ></v-autocomplete>
                        </v-flex>
                    </v-layout> -->
                        <!-- /*  <v-container v-if="enable_report">
                        <v-container>
                            <h1>{{ trans('data.customer_info') }}</h1>
                            <v-layout>
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
                                            <b-card-text>{{
                                                project.customer.id_card_number
                                            }}</b-card-text>
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
                            </v-layout>
                        </v-container>

                        <v-container>
                            <h1>{{ trans('data.agency_info') }}</h1>
                            <v-layout>
                                <v-flex xs12 sm3 md3>
                                    <b-card-group deck>
                                        <b-card
                                            :header="trans('data.trade_name')"
                                            header-tag="header1"
                                            title=""
                                        >
                                            <b-card-text>{{
                                                project.agency != null
                                                    ? project.agency.trade_name
                                                    : ''
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.agency != null
                                                    ? project.agency.record_number
                                                    : ''
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.agency != null ? project.agency.email : ''
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.agency != null ? project.agency.mobile : ''
                                            }}</b-card-text>
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>
                        </v-container>

                        <v-container>
                            <h1>{{ trans('data.location_info') }}</h1>
                            <v-layout>
                                <v-flex xs12 sm3 md3>
                                    <b-card-group deck>
                                        <b-card
                                            :header="trans('data.province_municipality')"
                                            header-tag="header1"
                                            title=""
                                        >
                                            <b-card-text>{{
                                                project.location.province_municipality
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.municipality
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.plan_id
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.plan_id
                                            }}</b-card-text>
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>

                            <v-layout>
                                <v-flex xs12 sm3 md3>
                                    <b-card-group deck>
                                        <b-card
                                            :header="trans('data.land_number')"
                                            header-tag="header1"
                                            title=""
                                        >
                                            <b-card-text>{{
                                                project.location.piece_number
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.size_number
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.instrument_number
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.instrument_date
                                            }}</b-card-text>
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>

                            <v-layout>
                                <v-flex xs12 sm3 md3>
                                    <b-card-group deck>
                                        <b-card
                                            :header="trans('data.northern_border')"
                                            header-tag="header1"
                                            title=""
                                        >
                                            <b-card-text>{{
                                                project.location.northern_border
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.eastern_border
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.western_border
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.southern_border
                                            }}</b-card-text>
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>

                            <v-layout>
                                <v-flex xs12 sm3 md3>
                                    <b-card-group deck>
                                        <b-card
                                            :header="trans('data.northern_border')"
                                            header-tag="header1"
                                            title=""
                                        >
                                            <b-card-text>{{
                                                project.location.northern_border
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.eastern_border
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.western_border
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.southern_border
                                            }}</b-card-text>
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>

                            <v-layout>
                                <v-flex xs12 sm3 md3>
                                    <b-card-group deck>
                                        <b-card
                                            :header="trans('messages.status')"
                                            header-tag="header1"
                                            title=""
                                        >
                                            <b-card-text>{{
                                                trans('messages.' + project.location.status)
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                project.location.southern_border
                                            }}</b-card-text>
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>
                        </v-container>

                        <v-container>
                            <h1>{{ trans('data.project_info') }}</h1>
                            <v-layout>
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
                                            <b-card-text>
                                                {{
                                                    trans('messages.' + project.status)
                                                }}</b-card-text
                                            >
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
                                            <b-card-text>{{
                                                getFields(project.members, 'name')
                                            }}</b-card-text>
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>

                            <v-layout>
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
                                            <b-card-text>{{
                                                project.authorization_request_number
                                            }}</b-card-text>
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
                                            <b-card-text>{{ project.plot_number }}</b-card-text>
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>

                            <v-layout>
                                <v-flex xs12 sm3 md3>
                                    <b-card-group deck>
                                        <b-card
                                            :header="trans('data.cadastral_decision_number')"
                                            header-tag="header1"
                                            title=""
                                        >
                                            <b-card-text>{{
                                                project.cadastral_decision_number
                                            }}</b-card-text>
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
                                            <b-card-text>{{
                                                trans('data.' + project.buiding_type)
                                            }}</b-card-text>
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
                                            <b-card-text>{{ project.build_rate }}</b-card-text>
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>

                            <v-layout>
                                <v-flex xs12 sm3 md3>
                                    <b-card-group deck>
                                        <b-card
                                            :header="trans('data.billing_type')"
                                            header-tag="header1"
                                            title=""
                                        >
                                            <b-card-text
                                                >{{ trans('messages.' + project.billing_type) }}
                                            </b-card-text>
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
                                            <b-card-text>
                                                {{ trans('data.' + project.using) }}</b-card-text
                                            >
                                        </b-card>
                                    </b-card-group>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-container>*/ -->
                    </v-container>
                </v-card-text>
            </v-card>
        </v-form>
    </v-container>
</template>

<script>
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';

export default {
    components: {
        jsPDF,
    },
    props: {
        design_enginner_id: {
            required: true,
        },
    },
    data() {
        return {
            valid: true,
            type: 'testt',
            project_id: '',
            enginner_id: '',
            design_enginner: {},

            price: null,
            enginner_name: '',
            stage_name: '',

            /////curreny ///
            value: '',
            label: '',
            placeholder: ' ',
            readonly: false,
            disabled: false,
            outlined: true,
            clearable: true,
            valueWhenIsEmpty: '',
            options: {
                locale: 'pt-BR',
                prefix: '$',
                suffix: '',
                length: 11,
                precision: 2,
            },
            properties: {
                hint: '',
                // You can add other v-text-field properties, here.
            },

            heading: 'Design Request',
            moreText: [''],
            loading: false,
        };
    },
    created() {
        const self = this;
        self.reset();
        self.enginner_name = self.getCurrentUser().name;
        self.enginner_id = self.getCurrentUser().id;
        self.getRequestDesignStageDetail();
    },
    beforeDestroy() {
        const self = this;
    },

    mounted: function () {},
    methods: {
        reset() {
            // alert(4)
            //     this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },

        getRequestDesignStageDetail() {
            const self = this;
            let data = {
                design_enginner_id: self.design_enginner_id,
                //enginner_id: self.enginner_id,
            };
            axios
                .post('enginner_office/show-design-request-details', data)
                .then(function (response) {
                    var result = response.data.msg;
                    self.loading = false;
                    if (result.created_at != null) {
                        self.create_time = self.currentDateTime(result.created_at);
                    } else {
                        self.create_time = self.currentDateTime();
                    }
                    self.stage_name = result.stage.value;
                    self.price = result.price;
                    self.design_enginner = result;
                    /* self.$store.commit('showSnackbar', {
                        message: response.data.msg,
                        color: response.data.success,
                    });*/
                    if (response.data.success === true) {
                        // self.goBack();
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
        },

        currentDateTime(date1 = null) {
            const current = date1 != null ? new Date(date1) : new Date();
            const date =
                current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
            const time =
                current.getHours() + ':' + current.getMinutes() + ':' + current.getSeconds();
            const dateTime = date + ' ' + time;
            return dateTime;
        },
        send() {
            const self = this;

            let data = {
                design_enginner_id: self.design_enginner.id,
                price: self.price,
            };
            if (this.$refs.form.validate()) {
                self.loading = true;
                axios
                    .post('enginner_office/send-design-request-offer', data)
                    .then(function (response) {
                        self.loading = false;
                        if (response.data.success === true) {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                           self.goBack();
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
            //self.reset();
        },
        generatePDF() {
            const self = this;
            if (true) {
                const columns = [
                    { title: 'Title', dataKey: 'title' },
                    { title: 'Body', dataKey: 'body' },
                ];
                const doc = new jsPDF({
                    orientation: 'portrait',
                    unit: 'in',
                    format: 'letter',
                });
                // text is placed using x, y coordinates
                doc.setFontSize(16).text(this.heading, 0.5, 1.0);
                // create a line under heading
                doc.setLineWidth(0.01).line(0.5, 1.1, 8.0, 1.1);
                // Using autoTable plugin
                var items = [
                    { title: 'Enginnner Name', body: self.enginner_name },
                    { title: 'Price', body: self.price },
                    //   { title: 'Item 3', body: 'I am item 3 body text' },
                    // { title: 'Item 4', body: 'I am item 4 body text' },
                ];
                doc.autoTable({
                    columns,
                    body: items,
                    margin: { left: 0.5, top: 1.25 },
                });

                // Using array of sentences
                doc.addFont('helvetica');
                doc.setFont('Amiri');
                doc.setFontSize(12);
                doc.text(this.moreText, 0.5, 3.5, { align: 'left', maxWidth: '7.5' });
                //Creating footer and saving file
                doc.addFont('times');
                doc.setFontSize(11);
                //doc.addFontStyle('italic')
                doc.setTextColor(0, 0, 255);
                doc.text(
                    'This is a simple footer located .5 inches from page bottom',
                    0.5,
                    doc.internal.pageSize.height - 0.5
                );

                doc.save(`${this.heading}.pdf`);
            } else {
            }
        },

        enableReport(value) {
            const self = this;
            self.enable_report = true;
        },
    },
};
</script>
