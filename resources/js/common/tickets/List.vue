
<!-- For customer -->
<template>
    <v-container grid-list-md>
        <v-card class="mt-3">
            <ticket-edit ref="ticketEdit"></ticket-edit>
            <v-card-title primary-title xs8 sm8>
                <div>
                    <div class="headline">
                        {{ trans('data.visit_requests') }}
                    </div>
                </div>
                <v-spacer></v-spacer>
                <v-btn style="background-color:#06706d;color:white;" v-if="$can('tickets.create')"  class="lighten-1" @click="$router.push({name: 'create_visit_request_list', params: {request_type:'visit_request' }})">
                    {{ trans('messages.add') }}
                    <v-icon right dark>add</v-icon>
                </v-btn>
            </v-card-title>
            <v-divider></v-divider>
            <v-data-table
                :headers="headers"
                :pagination.sync="pagination"
                :total-items="total_items"
                :loading="loading"
                :items="projects"
                class="elevation-3"
            >
                <template slot="items" slot-scope="props">
                    <td>
                        <div style="display:inline-flex;padding-left:30%;" align="center">
                        <!-- $hasRole('employee') && -->
                        <!-- v-if="props.item.status!='accepted'" -->
                            <v-btn  small fab dark color="teal"   @click="$router.push({name: 'create_project',params: { project: props.item }})">
                                <v-icon color="white">add</v-icon>
                                <!-- {{trans('messages.add')}}-->
                            </v-btn>
                             <!-- v-if="!$can('superadmin')" -->
                       
                            <v-btn   v-if='props.item.status=="new"'  small fab dark color="success" @click="editRequest(props.item)">
                                <v-icon color="white">edit</v-icon>
                            </v-btn>
                            <!-- v-if="$can('superadmin')" -->
                            <div >
                                <v-btn color="primary"   small fab v-if=" $hasRole('superadmin') && (props.item.status=='pending' || props.item.status=='new')" dark @click="acceptProject(props.item.status,props.item.id)">
                                    <v-icon color="white">check</v-icon>
                                    <!--{{trans('data.accept')}}-->
                                </v-btn>
                            </div>
                            <!-- v-if="!$can('superadmin')" -->
                            <div >
                                <v-btn color="primary" small fab v-if="props.item.sent==0" dark @click="sendRequest(props.item)">
                                    <v-icon color="white">mail</v-icon>
                                    <!--{{trans('data.accept')}}-->
                                </v-btn>
                            </div>
                            <v-btn color="error" small fab dark @click="removeProject(props.item.id)">
                                <v-icon color="white">cancel</v-icon>
                                <!-- {{trans('messages.cancel')}}-->
                            </v-btn> 
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            <v-chip class="ma-2" v-if="props.item.status!=''" :color="props.item.status=='pending'?'red':'success'" text-color="white">
                                {{ props.item.status }}
                            </v-chip>
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            {{ props.item.customer.name }}
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            {{ getType(props.item.request_type) }}
                           <!-- {{ props.item.name?props.item.type_of_request:getVisitRequestType(props.item.id) }}-->
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            {{ props.item.project.name}}
                        </div>
                    </td>
                    <td>
                        <div align="center">
                            {{props.item.created_at? createdDate(props.item.created_at):'-' }}
                        </div>
                    </td>                  
                </template>
            </v-data-table>
        </v-card>
        <br>
            <div align="center">
                <v-btn style="background-color:#06706d;color:white;" @click="$router.go(-1)">
                    {{ trans('messages.back') }}
                </v-btn>
           </div>
        <br>
    </v-container>
</template>
<script>
import TicketEdit from './Edit';
import StatusLabel from '../../admin/status/StatusLabel';
export default {
    components: {
        TicketEdit,
        StatusLabel,
    },
    data() {
        const self = this;
        return {
            projects:[],
            total_items: 0,
            loading: false,
            pagination: { totalItems: 0 },
            projectRequests:[],
            request_types:[],
            headers: [
                {
                    text: self.trans('messages.action'),
                    value: false,
                    align: 'center',
                    sortable: false,
                },
                {
                    text: self.trans('messages.status'),
                    value: 'status',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.customer'),
                    value: 'customer',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('data.request_type'),
                    value: 'request_type',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('data.project_name'),
                    value: 'project_name',
                    align: 'center',
                    sortable: true,
                },
                {
                    text: self.trans('messages.created_at'),
                    value: 'created_at',
                    align: 'center',
                    sortable: true,
                },
            ],
            customername:'',
            items: [],
            employees: [],
            ticket_types: [],
            statuses: [],
            filters: [],
            customers: [],
            priorities: [],
            tabs: 'tab-1',
            ticket_stats: [],
            type:'',
        };
    },
    watch: {
        pagination: {
            handler() {
               // this.getTicketFromApi();
             //  this.getAllProjectRequest();
            },
        },
    },
    mounted() {
        const self = this;
        //self.getFilters();
        // self.getStatistics();
        self.$eventBus.$on('updateTicketsTable', data => {
            self.projectRequest=[];
            self.projects=[];
            self.getAllProjectRequest();
          //  self.getTicketFromApi();
            // self.getStatistics();
            //self.getFilters();
        });
        
    },
    beforeDestroy() {
        const self = this;
        self.$eventBus.$off('updateTicketsTable');
    },
    created(){
        const self = this;
        self.projectRequests=[];
        self.projects=[];
         self.getRequestTypes();
        this.getAllProjectRequest();
    },
    methods: {
      getRequestTypes(){
            const self = this;
            axios
                .get('/get-request-types')
                .then(function(response) {
                    self.request_types = response.data;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },
        sendRequest(request){
            const self = this;
            self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                okCb: () => {
                    axios.post('/confirm-send' ,request).then(function(response) {
                        self.projectRequest=[];
                        self.projects=[];
                        self.getAllProjectRequest();
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
                },
                cancelCb: () => {
                    console.log('CANCEL');
                },
            });
        },
        editRequest(request){
           // alert( request.status)
           // if( request.status ==  'new'){
                this.$router.push({name: 'edit_visit_request_list',params:{visit_request:request}});
            // }
            // else
            // {
            //     this.$router.push({name: 'edit-project',params:{project_request:request}});
            // }
        },
        getType(visit){
                const self = this;
                return self.request_types.find((o)=>o.key==visit).value;
            
        },
        getVisitRequestType(id){
            const self = this;
            axios.get('/visit-request-type/'+id).then(function(response) { 
                self.type= response.data.data;
            }).catch(function(error) {
                self.type= '-';
            });
            return self.type;
        },
        createdDate(date){
        const current_datetime = new Date(date);
        return current_datetime.toLocaleDateString('en-US');
        },
        acceptProject(status,id){
            const self = this;
             self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                message: self.trans('messages.are_you_sure'),
                okCb: () => {
                    let info={
                        status:status,
                        id:id
                    };
                    axios.post('/accept-project' ,info).then(function(response) {
                        self.projectRequest=[];
                        self.projects=[];
                        self.getAllProjectRequest();
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
                },
                cancelCb: () => {
                    console.log('CANCEL');
                },
            });     
        },
        removeProject(id){
            const self = this;
             self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                message: self.trans('messages.you_cant_restore_it'),
                okCb: () => {
                    axios.delete('/delete-requests/' +id).then(function(response) {
                         self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                         });

                        self.projectRequest=[];
                        self.projects=[];
                        self.getAllProjectRequest();
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
                },
                cancelCb: () => {
                    console.log('CANCEL');
                },
            });          
        },
        getCustomer(id){
            const self = this;
            axios.get('/get-Customer-name/'+id).then(function(response) { 
                self.customername= response.data.data;
            }).catch(function(error) {
                self.customername= '-';
            });
            return self.customername;
        },
        getAllProjectRequest(){ 
            const self = this;          
            self.loading = true;
             axios.get('/sent-requests').then(function(response) { 
               self.total_items = response.data.length;
             //   self.projectRequests = response.data.data;
                 self.projects=response.data;
                self.loading = false;
            //     if(response.data.data.length==1){
            //         response.data.data[0].visit_requests.forEach(el => {
            //             self.projects.push(el);               
            //         });
            //         response.data.data[0].projectrequest.forEach(el => {
            //             self.projects.push(el);
            //         });
            //     }else{
            //         for (let k = 0; k < response.data.data.length; k++) {
            //             const element = response.data.data[k];

            //             element.visit_requests.forEach(el => {
            //                 self.projects.push(el);                
            //             });
                        
            //             element.projectrequest.forEach(el => {
            //                 self.projects.push(el);
            //             });                    
            //         }
            //    }
            })
            .catch(function(error) {
                console.log(error);
            });
        },
        removeVisitRequest(id){

        },
        getTicketFromApi() {
            const self = this;
            self.loading = true;
            const { sortBy, descending, page, rowsPerPage } = self.pagination;
            var params = {
                sort_by: sortBy,
                descending: descending,
                page: page,
                rowsPerPage: rowsPerPage,
            };

            if (self.filters.assigned_to) {
                params['assigned_to'] = self.filters.assigned_to;
            }

            if (self.filters.category_id) {
                params['category_id'] = self.filters.category_id;
            }

            if (self.filters.priority) {
                params['priority'] = self.filters.priority;
            }

            if (self.filters.status) {
                params['status'] = self.filters.status;
            }

            if (self.filters.customer_id) {
                params['customer_id'] = self.filters.customer_id;
            }

            axios
                .get('/tickets', {
                    params: params,
                })
                .then(function(response) {
                    self.total_items = response.data.total;
                    self.items = response.data.data;
                    self.loading = false; 
                })
                .catch(function(error) {
                    console.log(error);
                });
        },
        edit(ticket_id) {
            this.$refs.ticketEdit.edit(ticket_id);
        },
        deleteTicket(ticket) {
            const self = this;
            self.$store.commit('showDialog', {
                type: 'confirm',
                icon: 'warning',
                title: self.trans('messages.are_you_sure'),
                message: self.trans('messages.you_cant_restore_it'),
                okCb: () => {
                    axios
                        .delete('/tickets/' + ticket.id)
                        .then(function(response) {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                            if (response.data.success === true) {
                             //   self.getTicketFromApi();
                                // self.getStatistics();
                                //self.getFilters();
                            }
                        })
                        .catch(function(error) {
                            console.log(error);
                        });
                },
                cancelCb: () => {
                    console.log('CANCEL');
                },
            });
        },
   /*    getFilters() {
            const self = this;
            axios
                .get('/tickets/get-filters')
                .then(function(response) {
                    self.employees = response.data.employees;
                    self.ticket_types = response.data.ticket_types;
                    self.statuses = response.data.statuses;
                    self.customers = response.data.customers;
                    self.priorities = response.data.priorities;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },*/
   /*      getStatistics() {
            const self = this;
            axios
                .get('/tickets-statistics')
                .then(function(response) {
                    self.ticket_stats = response.data;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },*/
    },
};
</script>
