<template>
    <div class="component-wrap">
        <AskPermissionModal ref="permissionref" />

        <v-container grid-list-md>
            <v-flex pt-3 pb-5>
                <h1 style="color: #0000008a" class="text-md-center">
                    {{ trans('data.Engineering_offices_system') }}
                </h1>
            </v-flex>
            <v-card pt-3>
                <v-card-text>
                    <v-container grid-list-lg>
                        <v-layout wrap>
                            <v-flex xs12 sm12 md4>
                                <v-flex xs12 sm12 md12 v-if="$can('tickets.view')">
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="
                                                $router.push({
                                                    name: 'visit_request_enginner_office_list',
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
                                                            trans('data.visit_requests')
                                                        }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                            <!--add after edititng -->
                            <!-- -->
                            <v-flex xs12 sm12 md4 v-if="$can('tickets.view')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card 
                                         @click="$router.push({name: 'design_request_enginnering_office_list'})"
                                         :elevation="hover ? 16 : 2">
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{
                                                            trans('data.design_requests')
                                                        }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                            <v-flex xs12 sm12 md4 v-if="$can('tickets.view')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card class="not_working" :elevation="hover ? 16 : 2">
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{
                                                            trans('data.contractor_request')
                                                        }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                            <v-flex xs12 sm12 md4 v-if="$can('archive')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card class="not_working" 
                                         @click="$router.push({ name: 'archives' })"
                                        :elevation="hover ? 16 : 2">
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.archive') }}&nbsp;&nbsp;
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
                                        <v-card class="not_working" :elevation="hover ? 16 : 2">
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.accounting') }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                            <v-flex xs12 sm12 md4 v-if="$can('report.view')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            class="not_working"
                                            :elevation="hover ? 16 : 2"
                                            @click="$router.push({ name: 'reports_list' })"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.reports') }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                            <v-flex xs12 sm12 md4 v-if="$can('employee.create')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="
                                                $router.push({ name: 'customer_office.create' })
                                            "
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.add_customer') }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                            <!--add after edititng -->
                            <v-flex xs12 sm12 md4 v-if="$can('tickets.view')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card :elevation="hover ? 16 : 2">
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{
                                                            trans('data.support_service_request')
                                                        }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                            <v-flex xs12 sm12 md4 v-if="$can('project.list')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="$router.push({ name: 'project_management_enginnering_office' })"
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{
                                                            trans('data.project_management')
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
                                            @click="$router.push({})"
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.public_bills') }}&nbsp;&nbsp;
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
                                            @click="$router.push({})"
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.statistics') }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                            <v-flex xs12 sm12 md4 v-if="$can('employee.view')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="
                                                $router.push({ name: 'users_enginner_office.list' })
                                            "
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.employees') }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>

                            <v-flex xs12 sm12 md4 v-if="$can('role.view')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="
                                                $router.push({ name: 'roles_enginner_office.list' })
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
                                                            trans('messages.manage_roles')
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

     <v-flex xs12 sm12 md4 v-if="$can('specialty.view')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="
                                                $router.push({ name: 'specialties.list' })
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
                                                            trans('data.specialties')
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
        // alert(self.$can('project.list'))
    },
    methods: {
        askforpermission() {
            const self = this;
            this.$refs.permissionref.create();
        },
    },
};
</script>
 

