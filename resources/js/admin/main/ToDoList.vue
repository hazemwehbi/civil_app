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
                            <v-flex xs12 sm12 md4 v-if="$can('tickets.view')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="$router.push({ name: 'visit_request_list' })"
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
                            <!-- @click="$router.push({name: 'visit_request_list'})" -->
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

                            <v-flex xs12 sm12 md4 v-if="$can('customer.create')">
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="$router.push({ name: 'users.create' })"
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
                                        <v-card
                                            @click="
                                                $router.push({
                                                    name: 'create_visit_request_list',
                                                    params: {
                                                        request_type: 'support_service_request',
                                                    },
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

                            <v-flex xs12 sm12 md4>
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="$router.push({ name: 'project-management' })"
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
                            <!--
                                <v-flex xs12 sm12 md4>
                                <v-flex xs12 sm12 md12>
                                    <v-hover  v-slot:default="{ hover }" open-delay="100" close-delay="100">
                                        <v-card  @click="$router.push({})"
                                                         :elevation="hover ? 16 : 2">
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p x-large style="font-size:18px; color:#06706d;" >
                                                        {{ trans('data.statistics') }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>                                    
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                                </v-flex>
-->
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
                                            @click="$router.push({ name: 'users.list' })"
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.users') }}&nbsp;&nbsp;
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
                                            @click="$router.push('/roles')"
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
                                            @click="$router.push({ name: 'requests_role.list' })"
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.request_role') }}&nbsp;&nbsp;
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
                                            @click="$router.push({ name: 'specialties.list' })"
                                            :elevation="hover ? 16 : 2"
                                        >
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p
                                                        x-large
                                                        style="font-size: 18px; color: #06706d"
                                                    >
                                                        {{ trans('data.specialties') }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex>
                            <!-- <v-flex xs12 sm12 md4>
                                <v-flex xs12 sm12 md12>
                                    <v-hover
                                        v-slot:default="{ hover }"
                                        open-delay="100"
                                        close-delay="100"
                                    >
                                        <v-card
                                            @click="
                                                $router.push({ name: 'requests_creating_projects' })
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
                                                            trans(
                                                                'data.requests_creating_projects'
                                                            )
                                                        }}&nbsp;&nbsp;
                                                        <v-icon :color="'#06706d'">settings</v-icon>
                                                    </p>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-flex> -->
                        </v-layout>
                    </v-container>
                </v-card-text>
            </v-card>
            <!-- <v-card :class="testtt" >
                <v-card-text>
                        <v-container grid-list-lg>
                            <v-layout wrap>

                                <v-flex xs12 sm12 md4>
                                <v-flex xs12 sm12 md12>
                                    <v-hover  v-slot:default="{ hover }" open-delay="100" close-delay="100">
                                        <v-card  @click="$router.push({name: 'project-management'})"
                                                         :elevation="hover ? 16 : 2">
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p x-large style="font-size:18px; color:#06706d;" >
                                                        {{ trans('data.project_management') }}&nbsp;&nbsp;
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
                                    <v-hover  v-slot:default="{ hover }" open-delay="100" close-delay="100">
                                        <v-card  @click="$router.push({name: 'offices_types'})"
                                                         :elevation="hover ? 16 : 2">
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p x-large style="font-size:18px; color:#06706d;" >
                                                        {{ trans('data.office\'s_types') }}&nbsp;&nbsp;
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
                                    <v-hover  v-slot:default="{ hover }" open-delay="100" close-delay="100">
                                        <v-card  @click="$router.push({name:'general_information'})"
                                                         :elevation="hover ? 16 : 2">
                                            <v-card-text>
                                                <div class="text-md-center mt-2">
                                                    <p x-large style="font-size:18px; color:#06706d;" >
                                                        {{ trans('data.general_information') }}&nbsp;&nbsp;
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
            </v-card> -->
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
    created() {},
    mounted(){
            this.$forceUpdate();
        console.log(this)
    },
    methods: {
        askforpermission() {
            const self = this;
            this.$refs.permissionref.create();

        },
    },
};
</script>
 

