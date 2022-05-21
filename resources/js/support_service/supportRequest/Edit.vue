<template>
    <v-layout row justify-center>
        <v-dialog v-model="dialog" persistent max-width="600px">
            <v-card>
                <v-card-title>
                    <v-icon>assignment</v-icon>
                    <span class="headline">
                        {{ trans('data.edit_design') }}
                    </span>
                    <v-spacer></v-spacer>
                    <v-btn flat icon @click="dialog = false">
                        <v-icon>clear</v-icon>
                    </v-btn>
                </v-card-title>
                <v-divider></v-divider>
                <v-card-text>
                    <v-form ref="form" v-model="valid" lazy-validation>
                        <v-container grid-list-md>
                            <v-layout row wrap>
                                <v-flex xs12 sm6 md6>
                                    <v-autocomplete item-text="name" item-value="id" :items="projects"
                                        v-model="support.project_id" :label="trans('data.project_name')" :rules="[
                                            (v) =>
                                                !!v ||
                                                trans('messages.required', {
                                                    name: trans('data.project_name'),
                                                }),
                                        ]" @change="(event) => updateEmployee(event, k)" required></v-autocomplete>
                                </v-flex>
                                <v-flex xs12 sm6 md6>
                                    <v-autocomplete item-text="name" item-value="id" :items="customers" :readonly="true"
                                        v-model="support.customer_id" :label="trans('messages.customer')" :rules="[
                                            (v) =>
                                                !!v ||
                                                trans('messages.required', {
                                                    name: trans('messages.customer'),
                                                }),
                                        ]" required></v-autocomplete>
                                </v-flex>
                            </v-layout>
                            <v-layout row>
                                <v-flex xs12 sm12 md12>
                                    <v-autocomplete class="content-sign" multiple :clearable="true"
                                        :deletable-chips="true" :dense="true" search-input="" :solo-inverted="false"
                                        :eager="true" :loading="false" :validate-on-blur="false"
                                        :persistent-placeholder="false" item-text="name" item-value="id" filled chips
                                        color="#00695c" :items="supporters" v-model="support.supporters"
                                        :label="trans('data.supporters')" :rules="[
                                            (v) =>
                                                (v && v.length > 0) ||
                                                trans('messages.required', {
                                                    name: trans('data.supporters'),
                                                }),
                                        ]" required></v-autocomplete>
                                </v-flex>
                            </v-layout>
                            <v-layout row>
                                <v-flex xs12 sm12 md12>
                                    <v-text-field v-model="support.note" :label="trans('data.note')" :readonly="isEdit">
                                    </v-text-field>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="green darken-1" flat @click="close">
                        {{ trans('data.cancel') }}
                    </v-btn>
                    <v-btn color="success" @click="update" :loading="loading" :disabled="!valid || !checkActive()">
                        {{ trans('messages.save') }}
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-layout>
</template>

<script>
export default {
    data() {
        return {
            valid: true,
            dialog: false,
            support: {
                id:null,
                customer_id: null,
                project_id: null,
                note: null,
                supporters: []
            },
            supporters: [],
            customers: [],
            projects: [],
            loading: false,
        };
    },
    mounted() {
        const self = this;
    },
    created() {
        const self = this;
        self.getCustomerProject();
        self.getCustomers();
        self.getSupporters();
    },
    beforeDestroy() {
        const self = this;
    },
    filters: {
        filterCategories: function (categories, project_id) {
            var project_id = project_id;
            var filteredCategories = [];

            _.forEach(categories, function (category) {
                if (category.project_id == project_id) {
                    filteredCategories.push(category);
                }
            });

            return filteredCategories;
        },
    },
    methods: {
        close() {
            const self = this;
            self.loading = false;
            self.dialog = false;
            self.reset();
            self.resetValidation();
            self.$eventBus.$emit('SUPPORT_UPDATED', response.data);
        },
        create(data) {
            const self = this;
            self.support.id = data.id;
            self.support.project_id = data.project_id;
            self.support.customer_id = data.customer_id;
            self.support.note = data.note;
            self.support.supporters = data.supporters.map(x=>x.id);
            self.dialog = true;
        },
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },
        update() {
            const self = this;
            let data = self.support;
            //   data['supporters']=self.support.supporters.map(i=>i.id)

            if (this.$refs.form.validate()) {
                self.loading = true;
                axios
                    .put('/estate_owner/request-support/' + self.support.id, data)
                    .then(function (response) {
                        if (response.data.success) {
                            self.loading = false;
                            self.dialog = false;
                            self.reset();
                            self.resetValidation();
                            if (response.data.success === true) {
                                self.$eventBus.$emit('SUPPORT_UPDATED', response.data);
                            }
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                        } else {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        },

        //////get data/////
        updateEmployee(value, key) {
            const self = this;
            axios
                .get('get-customer-project/' + value)
                .then(function (response) {
                    self.design.customer_id = response.data.id;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        getCustomerProject() {
            const self = this;
            axios
                .get('/projects-customer')
                .then(function (response) {
                    self.projects = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        getCustomers() {
            const self = this;
            axios
                .get('/estate_owner/customers')
                .then(function (response) {
                    self.customers = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        getSupporters() {
            const self = this;
            axios
                .get('/get-supporters')
                .then(function (response) {
                    self.supporters = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
    },
};
</script>
