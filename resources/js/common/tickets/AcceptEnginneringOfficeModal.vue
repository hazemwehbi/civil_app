<template>
    <div>
        <v-row justify="center">
            <v-dialog v-model="dialog" persistent max-width="500px">
                <v-card>
                    <v-card-text>
                        <v-container>
                            <v-row>
                                <v-col cols="12">
                                    <v-autocomplete
                                        item-text="name"
                                        item-value="id"
                                        :items="users"
                                        v-model="enginner"
                                        :label="trans('data.enginner')"
                                        v-validate="'required'"
                                        data-vv-name="enginner"
                                        :data-vv-as="trans('data.enginner')"
                                        :error-messages="errors.collect('enginner')"
                                        required
                                    ></v-autocomplete>
                                </v-col>
                                <v-col cols="12" sm="6">
                                    <v-datetime-picker
                                        :label="trans('data.visit_datetime')"
                                        :datetime="dead_line_date"
                                        v-model="dead_line_date"
                                    >
                                    </v-datetime-picker>
                                </v-col>
                            </v-row>
                        </v-container>
                    </v-card-text>
                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn style="color: #06706d" text @click="dialog = false"> Close </v-btn>
                        <v-btn
                            style="background-color: #06706d; color: white"
                            color="darken-1"
                            @click="save()"
                            :loading="loading"
                            :disabled="loading"
                            text
                        >
                            Save
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
        </v-row>
    </div>
</template>
<style scoped>
.style_rtl {
    padding-left: 5px;
}

.style_ltr {
    padding-right: 5px;
}
</style>
<script>
export default {
    name: 'permission',
    data() {
        return {
            users: [],
            enginner: '',
            dialog: false,
            dead_line_date:null,
            loading: false,
            status: '',
            id: '',
        };
    },
    mounted() {
        const self = this;
        self.loadUsers();
        self.setCurrentUser();
    },
        computed: {
        computedDateFormattedMomentjs() {
            const self = this;
            return null; //self.dead_line_date
            // ? moment(self.location.instrument_date).format('dddd, MMMM Do YYYY')
            // : '';
        },
        computedDateFormattedDatefns() {
            const self = this;
            return self.dead_line_date;
            // ? format(parseISO(self.location.instrument_date), 'EEEE, MMMM do yyyy')
            //  : '';
        },
    },
    methods: {
        //detects location from browser
        loadUsers() {
            const self = this;
            axios
                .get('get-my-users')
                .then(function (response) {
                    //self.gender_types = response.data.gender_types;
                    self.users = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        setCurrentUser() {
            const self = this;
            axios.get('/get-current-user').then(function (response) {
                if (!response.data.error_code) {
                    let user = response.data.data.original;
                    self.enginner = user.id;
                } else {
                    self.$store.commit('hideLoader');
                    self.$store.commit('showSnackbar', {
                        message: response.data.error_description,
                        color: 'red',
                    });
                }

                //  self.resetvalues(1);
            });
        },
        create() {
            const self = this;
            self.dialog = true;
        },
        fillData(data) {
            const self = this;
            self.status = data.status;
            self.id = data.id;
        },
        save() {
            const self = this;

            let data = {
                status: self.status,
                id: self.id,
                enginner: self.enginner,
                dead_line_date: self.dead_line_date,
            };

            self.$validator.validateAll().then((result) => {
                if (result == true) {
                    self.loading = true;
                    axios.post('/accept-project', data).then(function (response) {
                        if (!response.data.error_code) {
                            self.loading = false;
                            self.dialog = false;
                            self.$emit('next');
                            self.$store.commit('hideLoader');
                            self.$store.commit('showSnackbar', {
                                message:response.data.data ,
                                color: 'green',
                            });
                        } else {
                            self.$store.commit('hideLoader');
                            self.$store.commit('showSnackbar', {
                                message: response.data.error_description,
                                color: 'red',
                            });
                        }
                    });
                }
            });
        },
    },
};
</script>