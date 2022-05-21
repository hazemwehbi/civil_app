<template>
    <div class="component-wrap">
        <AskPermissionModal ref="permissionref" />

        <v-container grid-list-md>
            <v-flex pt-3 pb-5>
                <h1 style="color: #0000008a" class="text-md-center">
                    {{ trans('data.Engineering_offices_system') }}
                </h1>
            </v-flex>
            <v-card pt-3 :class="testtt">
                <v-card-text>
                    <v-container grid-list-lg>
                        <v-layout wrap>
                          

                                <!--add after edititng -->
                            <v-flex xs12 sm12 md4 >
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="
                                                $router.push({
                                                     name: 'support_request_support_list',
                                                    // params: {
                                                    ///     request_type: 'support_service_request',
                                                    /// },
                                                })
                                            "
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{
                                                            trans('data.requests')
                                                            
                                                        }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                        

                            <v-flex xs12 sm12 md4>
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="askforpermission()"
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{
                                                            trans('data.ask_for_permission')
                                                        }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>
                        </v-layout>
                    </v-container>
                </v-card-text>
            </v-card>

            <br />
            <div align="center">
                <v-btn style="background-color: #06706d; color: white" @click="$router.go(-1)">
                    {{ trans('messages.back') }}
                </v-btn>
            </div>
            <br />
        </v-container>
    </div>
</template>
<style scoped>
/* .not_working {
   // background-color: red;
} */
</style>
<script>
import AskPermissionModal from './components/AskPermissionModal.vue';
export default {
    components: {
        AskPermissionModal: AskPermissionModal,
    },
    data() {
        return {
            loading: false,
        };
    },
    created() {
        const self = this;
    },
    methods: {
        askforpermission() {
            const self = this;
            this.$refs.permissionref.create();
        },
    },
};
</script>
 

