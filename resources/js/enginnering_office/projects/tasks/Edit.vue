<template>
    <v-layout row justify-center>
        <!-- category Add -->
        <CategoryAdd ref="categoryAdd"></CategoryAdd>
        <v-dialog v-model="dialog">
            <v-card>
                <v-card-title>
                    <v-icon>assignment</v-icon>
                    <span class="headline">
                        {{ trans('messages.edit_task') }}
                    </span>
                    <v-spacer></v-spacer>
                    <v-btn flat icon @click="dialog = false"> <v-icon>clear</v-icon> </v-btn>
                </v-card-title>
                <v-divider></v-divider>
                <v-card-text>
                    <v-form ref="form" v-model="valid" lazy-validation>
                        <v-container grid-list-md>
                            <v-layout row wrap>
                                <v-flex xs12 md12>
                                    <v-text-field
                                        v-model="task.subject"
                                        required
                                        :label="trans('messages.subject')"
                                        :rules="[
                                            (v) =>
                                                !!v ||
                                                trans('messages.required', {
                                                    name: trans('messages.subject'),
                                                }),
                                        ]"
                                    >
                                    </v-text-field>
                                </v-flex>
                            </v-layout>
                            <v-layout row wrap>
                                <v-flex xs12 sm12 md12>
                                    {{ trans('messages.description') }}
                                    <quill-editor v-model="task.description"> </quill-editor>
                                </v-flex>
                            </v-layout>
                            <v-layout row wrap>
                                <v-flex xs12 md4>
                                    <v-datetime-picker
                                        :label="trans('messages.start_date')"
                                        :datetime="start_date"
                                        :okText="trans('data.ok')"
                                        :clearText="trans('data.clear')"
                                        timeFormat="HH:mm"
                                        v-model="start_date"
                                    >
                                    </v-datetime-picker>
                                    <!-- <div class="v-input v-text-field theme--light">
                                    <div class="v-input__control">
                                        <div class="v-input__slot">
                                            <div class="v-text-field__slot">
                                                <label
                                                    aria-hidden="true"
                                                    class="
                                                        v-label v-label--active
                                                        theme--light
                                                        flat_picker_label
                                                    "
                                                >
                                                    {{ trans('messages.start_date') }}
                                                </label>
                                                <flat-pickr
                                                    v-model="start_date"
                                                    name="start_date"
                                                    required
                                                    :config="flatPickerDateTime()"
                                                ></flat-pickr>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->
                                </v-flex>

                                <v-flex xs12 md4>
                                    <v-datetime-picker
                                        :label="trans('messages.due_date')"
                                        :datetime="due_date"
                                        :okText="trans('data.ok')"
                                        :clearText="trans('data.clear')"
                                        timeFormat="mm:HH"
                                        dateFormat="dd::MM::yyyy"
                                        v-model="due_date"
                                    >
                                    </v-datetime-picker>

                                    <!-- <div class="v-input v-text-field theme--light">
                                    <div class="v-input__control">
                                        <div class="v-input__slot">
                                            <div class="v-text-field__slot">
                                                <label
                                                    aria-hidden="true"
                                                    class="
                                                        v-label v-label--active
                                                        theme--light
                                                        flat_picker_label
                                                    "
                                                >
                                                    {{ trans('messages.due_date') }}
                                                </label>
                                                <flat-pickr
                                                    v-model="due_date"
                                                    name="due_date"
                                                    required
                                                    :config="flatPickerDateTime()"
                                                ></flat-pickr>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->
                                </v-flex>

                                <v-flex xs12 md4>
                                    <v-select
                                        item-text="value"
                                        item-value="key"
                                        :items="priority"
                                        v-model="task.priority"
                                        :label="trans('messages.priority')"
                                    ></v-select>
                                </v-flex>
                            </v-layout>
                            <v-layout row wrap>
                                <v-flex xs12 md4 v-if="billingType == 'task_hours'">
                                    <v-text-field
                                        v-model="task.hourly_rate"
                                        :label="trans('messages.hourly_rate')"
                                    >
                                    </v-text-field>
                                </v-flex>

                                <v-flex xs12 md4>
                                    <v-autocomplete
                                        class="content-sign"
                                        item-text="name"
                                        item-value="id"
                                        :items="projectMembers"
                                        v-model="task.user_id"
                                        :label="trans('messages.assign_to')"
                                        multiple
                                        :rules="[
                                            (v) =>
                                                (v && v.length > 0) ||
                                                trans('messages.required', {
                                                    name: trans('messages.assign_to'),
                                                }),
                                        ]"
                                        requiredr-messages="errors.collect('assign_to')"
                                        required
                                    ></v-autocomplete>
                                </v-flex>
                                <v-flex xs12 md5>
                                    <v-autocomplete
                                        item-text="name"
                                        item-value="id"
                                        :items="categories"
                                        v-model="category_id"
                                        :label="trans('messages.category')"
                                    ></v-autocomplete>
                                </v-flex>
                                <v-flex md1>
                                    <v-btn @click="createCategory" small color="primary" fab dark>
                                        <v-icon>add</v-icon>
                                    </v-btn>
                                </v-flex>
                                <v-flex xs12 md2 v-if="$hasRole('employee')">
                                    <v-checkbox
                                        :label="trans('messages.show_to_customer')"
                                        color="primary"
                                        value="1"
                                        v-model="task.show_to_customer"
                                        hide-details
                                    ></v-checkbox>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="green darken-1" flat @click="dialog = false">
                        {{ trans('data.close') }}
                    </v-btn>
                    <v-btn
                        color="success"
                        @click="store"
                        :loading="loading"
                        :disabled="!valid || !checkActive()"
                    >
                        {{ trans('messages.update') }}
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-layout>
</template>

<script>
import CategoryAdd from '../category/Add';
export default {
    components: {
        CategoryAdd,
    },
    data() {
        return {
            valid: true,
            dialog: false,
            task: [],
            start_date: null,
            due_date: null,
            projectId: null,
            priority: [],
            projectMembers: [],
            taskMembers: [],
            billingType: null,
            project: [],
            categories: [],
            category_id: null,
            loading: false,
            task_id: null,
        };
    },
    mounted() {
        const self = this;
        self.$eventBus.$on('updateCategoryList', (data) => {
            self.categories.push(data);
            self.category_id = data.id;
        });
    },
    beforeDestroy() {
        const self = this;
        self.$eventBus.$off('updateCategoryList');
    },
    created() {},
    methods: {
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },
        edit(task_params) {
            const self = this;

            self.$validator.reset();
            self.projectId = task_params.project_id;
            self.task_id = task_params.task_id;
            axios
                .get('/enginner_office/project-tasks/' + task_params.task_id + '/edit', {
                    params: { project_id: task_params.project_id },
                })
                .then(function (response) {
                    if (response.data.success) {
                        self.getProjectMember();
                        self.task = response.data.msg.task;
                        self.task.user_id = response.data.msg.task_members;
                        self.task.show_to_customer =
                            response.data.msg.task.show_to_customer.toString();
                        self.category_id = response.data.msg.task.category_id;
                        self.start_date = response.data.msg.task.start_date;
                        self.due_date = response.data.msg.task.due_date;
                        self.priority = response.data.msg.priority;
                        self.categories = response.data.msg.categories;
                        self.dialog = true;
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
        },
        store() {
            const self = this;
            let data = {
                project_id: self.projectId,
                subject: self.task.subject,
                hourly_rate: self.task.hourly_rate,
                priority: self.task.priority,
                description: self.task.description,
                show_to_customer: self.task.show_to_customer,
                user_id: self.task.user_id,
                start_date: self.start_date,
                due_date: self.due_date,
                category_id: self.category_id,
            };

            if (this.$refs.form.validate()) {
                self.loading = true;

                axios
                    .put('/enginner_office/project-tasks/' + self.task_id, data)
                    .then(function (response) {
                        self.loading = false;
                        self.dialog = false;
                        self.$store.commit('showSnackbar', {
                            message: response.data.msg,
                            color: response.data.success,
                        });

                        if (response.data.success === true) {
                            self.$eventBus.$emit('updateTaskTable', response.data.task);
                            self.$eventBus.$emit('updateDashboard', response.data.task);
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        },
        createCategory() {
            const self = this;
            var data = { type: 'tasks', project_id: self.projectId };
            self.$refs.categoryAdd.create(data);
        },
        // getProjectMember() {
        //     const self = this;
        //     axios
        //         .get('projects/' + self.projectId + '/members', { params: { type: 'task' } })
        //         .then(function (response) {
        //             self.projectMembers = response.data;
        //         })
        //         .catch(function (error) {
        //             console.log(error);
        //         });
        // },

        getProjectMember() {
            const self = this;
            axios
                .get('/enginner_office/all-employee/' + self.getCurrentUser().id)
                .then(function (response) {
                    self.projectMembers = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        createCategory() {
            const self = this;
            var data = { type: 'tasks', project_id: self.projectId };
            self.$refs.categoryAdd.create(data);
        },
    },
};
</script>
