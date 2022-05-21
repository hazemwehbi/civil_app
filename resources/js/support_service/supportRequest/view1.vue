<template>
    <v-layout row justify-center>
        <v-dialog v-model="dialog" persistent max-width="600px">
            <v-card>
                <v-card-title>
                    <v-icon>assignment</v-icon>
                    <span class="headline">
                        {{ trans('data.view_support') }}
                    </span>
                    <v-spacer></v-spacer>
                    <v-btn flat icon @click="dialog = false">
                        <v-icon>clear</v-icon>
                    </v-btn>
                </v-card-title>

                <v-tabs dark color="#00695c" class="background-color" show-arrows>
                    <v-tab> {{ trans('data.view_support_details') }}</v-tab>
                    <v-tab v-if="false"> {{ trans('data.offer_detail') }}</v-tab>

                    <v-tab-item :key="1">
                        <v-card>
                            <v-card-text>
                                <v-container grid-list-md>
                                    <v-layout row wrap>
                                        <v-flex xs12 sm6 md6>
                                            <v-text-field v-model="support.project.name" :readonly="true"
                                                :label="trans('data.project_name')"></v-text-field>
                                        </v-flex>
                                        <v-flex xs12 sm6 md6>
                                            <v-text-field v-model="support.customer.name" :readonly="true"
                                                :label="trans('messages.customer')"></v-text-field>
                                        </v-flex>

                                     

                                    </v-layout>
                                    <v-layout row>
                                        <v-flex xs12 sm12 md12>
                                            <v-text-field   :readonly="true" v-if="price != null" :label="trans('data.price')"
                                                :value="price" prefix="$"></v-text-field>

                                            <v-text-field   :readonly="true" v-else :label="trans('data.price')" :value="price_not_found">
                                            </v-text-field>
                                        </v-flex>

                                    </v-layout>
                                    <v-layout row>
                                        <v-flex xs12 sm12 md12>
                                            <v-text-field v-model="support.note" :readonly="true"
                                                :label="trans('data.note')"></v-text-field>
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
            dialog: true,
            support: {'sent':0},
            supporters_name: '',
            supporters: [],
            loading: false,
            price:false,
            price_not_found: 'لم يتم ارسال السعر بعد'
        };
    },
    mounted() {
        const self = this;
    },
    created() {
        const self = this;


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
            self.supporters=[];
            self.dialog = true;
            console.log(data);
            self.support = data;
            self.price=data.support_request_users.find(
                    (x) =>
                        x.support_id == self.getCurrentUser().id
                ).price

       

        },

    },
};
</script>
