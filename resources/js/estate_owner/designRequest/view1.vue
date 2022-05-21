<template>
    <v-layout row justify-center>
        <v-dialog v-model="dialog" persistent max-width="600px">
            <v-card>
                <v-card-title>
                    <v-icon>assignment</v-icon>
                    <span class="headline">
                        {{ trans('data.view_design') }}
                    </span>
                    <v-spacer></v-spacer>
                    <v-btn flat icon @click="dialog = false"> <v-icon>clear</v-icon> </v-btn>
                </v-card-title>

                <v-tabs dark color="#00695c" class="background-color" show-arrows>
                    <v-tab> {{ trans('data.view_design_details') }}</v-tab>
                    <v-tab v-if="employees.length > 0"> {{ trans('data.offer_detail') }}</v-tab>

                    <v-tab-item :key="1">
                        <v-card>
                            <v-card-text>
                                <v-container grid-list-md>
                                    <v-layout row wrap>
                                        <v-flex xs12 sm6 md6>
                                            <v-text-field
                                                v-model="design.project.name"
                                                :readonly="true"
                                                :label="trans('messages.customer')"
                                            ></v-text-field>
                                        </v-flex>
                                        <v-flex xs12 sm6 md6>
                                            <v-text-field
                                                v-model="design.customer.name"
                                                :readonly="true"
                                                :label="trans('messages.customer')"
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                    <v-layout row>
                                        <v-flex xs12 sm12 md12>
                                            <v-text-field
                                                v-model="design.office.name"
                                                :readonly="true"
                                                :label="trans('data.enginnering_office_name')"
                                            ></v-text-field>
                                        </v-flex>
                                        <v-flex xs12 sm6 md6>
                                            <v-text-field
                                                v-model="design.status"
                                                :readonly="true"
                                                :label="trans('messages.status')"
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                    <v-layout row>
                                        <v-flex xs12 sm12 md12>
                                            <v-text-field
                                                v-model="design.note"
                                                :readonly="true"
                                                :label="trans('data.note')"
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-container>
                            </v-card-text>
                        </v-card>
                    </v-tab-item>

                    <v-tab-item :key="2">
                        <v-card>
                            <v-card-text>
                                <v-container fluid>
                                    <v-layout
                                        class="v-layout-grid"
                                        row
                                        wrap
                                        v-for="enginner in employees"
                                        :key="enginner != undefined ? enginner.id : 0"
                                    >
                                        <v-flex xs4 sm4 md5>
                                            <v-text-field
                                                :label="trans('data.stage')"
                                                :value="enginner.stage"
                                            ></v-text-field>
                                        </v-flex>

                                        <v-flex xs4 sm4 md3>
                                            <v-text-field
                                                :label="trans('data.enginner_name')"
                                                :value="enginner.name"
                                            ></v-text-field>
                                        </v-flex>

                                        <v-flex xs4 sm4 md3>
                                            <v-text-field
                                                v-if="enginner.price != null"
                                                :label="trans('data.price')"
                                                :value="enginner.price"
                                                prefix="$"
                                            ></v-text-field>

                                            <v-text-field
                                                v-else
                                               :label="trans('data.price')"
                                                :value="price_not_found"
                                            ></v-text-field>
                                        </v-flex>
                                    </v-layout>
                                </v-container>
                            </v-card-text>
                        </v-card>
                    </v-tab-item>
                </v-tabs>

                <!-- <v-card-text>
                    <v-form ref="form" v-model="valid" lazy-validation>
                        <div v-if="employees.length > 0">
                            <h3>{{ trans('data.employees') }}</h3>
                        </div>
                    </v-form>
                </v-card-text> -->

                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="green darken-1" flat @click="close">
                        {{ trans('data.cancel') }}
                    </v-btn>
                    <!-- <v-btn
                        color="success"
                        @click="update"
                        :loading="loading"
                        :disabled="!valid || !checkActive()"
                    >
                        {{ trans('messages.save') }}
                    </v-btn> -->
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-layout>
</template>
<style>
.background-color {
    background-color: '#00695c';
}
.v-layout-grid {
    column-gap: 15px;
}
</style>
<script>
export default {
    data() {
        return {
            valid: true,
            dialog: false,
            design: {},
            employees: [],
            loading: false,
            price_not_found:'لم يتم ارسال السعر بعد'
        };
    },
    mounted() {
        const self = this;
    },
    created() {
        const self = this;

        self.dialog = true;
    },
    beforeDestroy() {
        const self = this;
    },

    methods: {
        close() {
            const self = this;
            self.loading = false;
            self.dialog = false;
            // this.$refs.form.resetValidation();
            // this.$refs.form.reset();
        },
        create(data) {
            const self = this;
            self.employees = [];
            self.design = data;
            for (var i = 0; i < data.design_enginners.length; i++) {
                self.employees.push({
                    id: data.design_enginners[i].enginner_id,
                    name: '',
                    is_active: data.design_enginners[i].is_active ? 'مفعل':'غير مفعل ',
                    stage: '',
                    price: data.design_enginners[i].price,
                });
                self.getEmployee(data.design_enginners[i].enginner_id, i);
                self.getStage(data.design_enginners[i].stage_id, i);
            }
            self.dialog = true;
        },
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },
        getEmployee(user_id, i) {
            const self = this;
            axios.get('/admin/users/' + user_id + '/name').then(function (response) {
                self.employees[i].name = response.data.name;
                //  return
            });
        },

        getStage(stage_id, i) {
            const self = this;
            axios.get('get-stage/' + stage_id).then(function (response) {
                self.employees[i].stage = response.data.value;
                //  return
            });
        },
    },
};
</script>
