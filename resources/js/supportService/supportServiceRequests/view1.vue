<template>
    <v-layout row justify-center>
        <v-dialog v-model="dialog" persistent max-width="600px">
                   <div class="overflow-hidden bg-white shadow sm:rounded-lg mx-auto">
  <div class="px-4 py-2 sm:px-6 flex">
    <h3 class="text-2xl my-auto font-medium leading-6 text-gray-900">{{ trans('data.view_support') }}</h3>
            <v-spacer></v-spacer>
                    <v-btn flat icon @click="dialog = false"> <v-icon>clear</v-icon> </v-btn>
  </div>
  <div class="border-t border-gray-200">
    <dl>
      <div :class="$vuetify.breakpoint.xsOnly?'flex justify-around':''" class="bg-gray-50 px-4 py-3 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-md font-medium text-gray-500">{{trans('data.project_name')}}</dt>
        <dd class="mt-1 text-md text-gray-900 sm:col-span-2 sm:mt-0">{{ design.project.name }}</dd>
      </div>
      <div :class="$vuetify.breakpoint.xsOnly?'flex justify-around':''" class="bg-white px-4 py-3 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-md font-medium text-gray-500">{{trans('messages.customer')}}</dt>
        <dd class="mt-1 text-md text-gray-900 sm:col-span-2 sm:mt-0">{{ design.customer.name }}</dd>
      </div>
        <div :class="$vuetify.breakpoint.xsOnly?'flex justify-around':''" class="bg-gray-50 px-4 py-3 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-md font-medium text-gray-500">{{ trans('data.created_by') }}</dt>
        <dd class="mt-1 text-md text-gray-900 sm:col-span-2 sm:mt-0">{{ design.creator.name }}</dd>
      </div>
    
      <div :class="$vuetify.breakpoint.xsOnly?'flex justify-around':''" class="bg-white px-4 py-3 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-md font-medium text-gray-500">{{ trans('data.note') }}</dt>
        <dd class="mt-1 text-md text-gray-900 sm:col-span-2 sm:mt-0">{{ design.note }}</dd>
      </div>
    </dl>
    <div class="mx-auto my-2 flex justify-center border-t border-gray-200">
        <v-btn color="green darken-1" flat @click="close">
                        {{ trans('data.close') }}
                    </v-btn>
                    </div>
  </div>
</div>
            <!--<v-card>
                <v-card-title>
                    <v-icon>assignment</v-icon>
                    <span class="headline">
                        {{ trans('data.view_design') }}
                    </span>
                    <v-spacer></v-spacer>
                    <v-btn flat icon @click="dialog = false"> <v-icon>clear</v-icon> </v-btn>
                </v-card-title>
                <v-divider></v-divider>
                <v-card-text>
                    <v-form ref="form" v-model="valid" lazy-validation>
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
                    </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="green darken-1" flat @click="close">
                        {{ trans('data.close') }}
                    </v-btn>
                </v-card-actions>
            </v-card>-->
        </v-dialog>
    </v-layout>
</template>

<script>
export default {
    data() {
        return {
            valid: true,
            dialog: false,
            design: {},
            loading: false,
        };
    },
    mounted() {
        const self = this;
    },
    created() {
        const self = this;
     //   self.dialog = true;
    },
    beforeDestroy() {
        const self = this;
    },

    methods: {
        close() {
            const self = this;
            self.loading = false;
            self.dialog = false;

        },
        create(data) {
            const self = this;
            self.design = data;
            self.dialog = true;
        },
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },
    },
};
</script>
