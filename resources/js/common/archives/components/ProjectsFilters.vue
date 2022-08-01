<template>
<div>
                                        <v-layout wrap class="mx-auto" style="max-width:80%">
                                            <v-flex xs12 md5 class="mx-auto">
                                                <v-autocomplete
                                                    item-text="name"
                                                    item-value="id"
                                                    :items="filterTypeList"
                                                    v-model="filters.type"
                                                    @change="selectData"
                                                    :label="trans('data.searchBy.searchBy')"
                                                ></v-autocomplete>
                                            </v-flex>
                                            <v-flex xs12 md5 class="mx-auto"  v-if="tableRelation && !locationSearch">
                                                <v-autocomplete
                                                    item-text="name"
                                                    item-value="id"
                                                    :items="filterColumnsList"
                                                    v-model="filters.columnTable"
                                                    :label="trans('data.searchBy.selectData')"
                                                ></v-autocomplete>
                                            </v-flex>
                                                <v-flex xs12 md5 class="mx-auto" v-if="locationSearch">
                                             <v-select
                                        item-text="value"
                                        item-value="key"
                                        :items="province_municipalities"
                                        v-model="filters.province_municipality"
                                        @change="province_municipality = true"
                                        :label="trans('data.province_municipality')"
                                        :data-vv-as="trans('data.province_municipality')"
                                    ></v-select>
      </v-flex>
                                                   <v-flex xs12 md5 class="mx-auto" v-if="province_municipality">
                                          <v-select
                                        item-text="value"
                                        item-value="key"
                                        :items="municipalities"
                                         @change="municipality = true"
                                        v-model="filters.municipality"
                                        :label="trans('data.municipality')"
                                        :data-vv-name="filters.municipality"
                                        :data-vv-as="trans('data.municipality')"
                                    ></v-select>
      </v-flex>
        <v-flex xs12 md5 class="mx-auto"  v-if="municipality">
                                                <v-text-field
                                        v-model="filters.plan_id"
                                        @change="plan_id = true"
                                        :label="trans('data.plan_id')"
                                    ></v-text-field>
                                            </v-flex>
           
        <v-flex xs12 md5 class="mx-auto" v-if="plan_id">
                 <v-text-field
                                        v-model="filters.piece_number"
                                        :label="trans('data.piece_number')"
                                    ></v-text-field>
                              </v-flex>      
                                                                                <v-flex xs12 md5 class="mx-auto" v-if="!locationSearch">
                                             <v-text-field
        v-model="filters.searchInTable"
        append-icon="search"
        :label="trans('data.searchBy.searchWord')"
        single-line     
        hide-details
      />
      </v-flex>    
                                        </v-layout>
                                         <v-layout wrap class="mx-auto" style="max-width:80%">
        <v-flex xs12 md5 class="mx-auto">
                                             <v-datetime-picker
        v-model="filters.startDate"
        append-icon="time"
        :label="trans('data.startDate')"
        single-line
        
        hide-details
      />
      </v-flex>
                                     <v-flex xs12 md5 class="mx-auto">
                                             <v-datetime-picker
        v-model="filters.endDate"
        append-icon="time"
        :label="trans('data.endDate')"
        single-line
        
        hide-details
      />
      </v-flex>
      <v-flex xs12 md4 class="mx-auto mt-3">
       <v-btn @click="filterChanged" color="primary">{{trans('data.search')}}</v-btn>
       <v-btn @click="clearInputs" color="secondary">{{trans('data.clear')}}</v-btn>
      </v-flex>
   
      </v-layout>
   <project-detailes v-if="projects" :projectData="projectData" class="mt-5 mx-auto" style="max-width:80%" />
   <report-detailes v-if="reports" :reportData="projectData" class="mt-5 mx-auto" style="max-width:80%" />                               
    
</div>

</template>
<script>
import ProjectDetailes from './projectDetailes.vue'
import ReportDetailes from './ReportDetailes.vue'

export default {
    components:{
        ProjectDetailes,
        ReportDetailes
    },
    props:{
       projects: {
        type: Boolean,
        default: true
       },
          reports: {
        type: Boolean,
        default: false
       }
    },
 data() {
        const self = this;
        return {
            projectID: null,
            locationSearch:false,
            projectData: [],
            reportData: [],
            province_municipalities: [],
            municipalities: [],
            filterColumnsList: [],
            tableRelation: false,
            province_municipality:false,
            municipality:false,
            plan_id: false,
            piece_number: false,
            statuses: [],
            filterTypeList:[
              /*  {id: 'categories', name: self.trans('data.searchBy.category')},*/
                {id: 'creator', name: self.trans('data.searchBy.customer')},
              /*  {id: 'members', name: self.trans('data.searchBy.member')},
                 {id: 'lead', name: self.trans('data.searchBy.lead')},
                {id: 'tasks', name: self.trans('data.searchBy.tasks')},*/
                {id: 'location', name: self.trans('data.searchBy.location')},
                {id: 'id', name: self.trans('data.searchBy.id')},
              /*  {id: 'report', name: self.trans('data.searchBy.report')},
                {id: 'visitRequests', name: self.trans('data.searchBy.visitRequest')},
                {id: 'agency', name: self.trans('data.searchBy.Agency')},
                {id: 'transactions', name: self.trans('data.searchBy.transactions')},
                {id: 'project_type', name: self.trans('data.searchBy.project_type')},
                {id: 'unit_number', name: self.trans('data.searchBy.unit_number')},
                {id: 'role_number', name: self.trans('data.searchBy.role_number')},
                {id: 'buiding_type', name: self.trans('data.searchBy.buiding_type')},
                {id: 'build_rate', name: self.trans('data.searchBy.build_rate')},
                {id: 'status', name: self.trans('data.searchBy.status')},
                {id: 'estimated_cost', name: self.trans('data.searchBy.estimated_cost')},
                {id: 'favorite', name: self.trans('data.searchBy.favorite')},
                {id: 'estimated_hours', name: self.trans('data.searchBy.estimated_hours')},
                {id: 'price_per_hours', name: self.trans('data.searchBy.price_per_hours')},
                {id: 'total_rate', name: self.trans('data.searchBy.total_rate')},
                {id: 'start_date', name: self.trans('data.start_date')},
                {id: 'end_date', name: self.trans('data.end_date')},
                {id: 'authorization_request_number', name: self.trans('data.searchBy.authorization_request_number')},*/
                ],
            lists:{
               categories:[{id:'name', name: self.trans('data.name')},
               {id:'type', name: self.trans('data.type')}],
               creator:[{id:'name', name: self.trans('data.name')},
               {id:'email',name: self.trans('data.email_address')},
               {id:'mobile',name: self.trans('data.mobile')},
              {id:'id_card_number',name: self.trans('data.id_card_number')},
             ],
               tasks:[{id:'subject',name: self.trans('data.subject')},
               {id:'hourly_rate',name: self.trans('data.hourly_rate')},
               {id:'start_date',name: self.trans('data.bank_name')},
               {id:'due_date',name: self.trans('data.bank_name')},
               {id:'priority',name: self.trans('data.bank_name')},
               {id:'show_to_customer',name: self.trans('data.bank_name')},
               {id:'is_completed',name: self.trans('data.bank_name')}],
               visitRequests:[
                    {id:'request_type',name: self.trans('data.request_type')},
                    {id:'status',name: self.trans('data.searchBy.status')},
                    {id:'office_status',name: self.trans('data.office_status')},
                    {id:'sent',name: self.trans('data.sent')},
                    {id:'dead_line_date',name: self.trans('data.dead_line_date')}],
               agency:[
                {id:'trade_name',name: self.trans('data.trade_name')},
               {id:'record_number',name: self.trans('data.record_number')},
               {id:'delegate_record',name: self.trans('data.delegate_record')},
               {id:'agency_number',name: self.trans('data.agency_number')},
               {id:'agent_name',name: self.trans('data.agent_name')},
              {id:'agent_card_number',name: self.trans('data.agent_card_number')},
              {id:'email',name: self.trans('data.email_address')},
              {id:'mobile',name: self.trans('data.mobile')}],
               location:[{id:'province_municipality',name: self.trans('data.province_municipality')},
               {id:'municipality',name: self.trans('data.municipality')},
               {id:'category',name: self.trans('data.searchBy.category')},
               {id:'piece_number',name: self.trans('data.piece_number')},
               {id:'size_number',name: self.trans('data.size_number')},
               {id:'instrument_number',name: self.trans('data.instrument_number')},
                {id:'status',name: self.trans('data.searchBy.status')}],
               report:[{id:'name', name: self.trans('data.name')},
               {id:'description', name: self.trans('data.description')},
               {id:'type', name: self.trans('data.type')}],
               transactions:[{id:'type', name: self.trans('data.type')},
               {id:'status', name: self.trans('data.searchBy.status')},
               {id:'title', name: self.trans('messages.title')},
               {id:'discount_amount', name: self.trans('messages.discount_amount')},
               {id:'total', name: self.trans('messages.total')},
               {id:'payment_status', name: self.trans('messages.payment_status')}]
            },
            url: null,
            users: [{ id: 0, name: self.trans('messages.all') }],
            filters: [],
            statistics: [],
            loading: false
        };
    },
    created() {
        const self = this;
        self.url = '/project/dataFilters';
        self.getDataFromApi();
        self.getFilterData();
         self.getLocationInfo();
        self.$eventBus.$on('updateProjectTable', data => {
            self.url = '/project/dataFilters';
            self.projectData = [];
            self.reportData=[];
            self.getDataFromApi();
        });
    },
    methods:{
        selectData(event){
            this.locationSearch = false
                this.province_municipality=false
                this.municipality=false
                this.plan_id=false
            this.tableRelation = this.lists[event]
            this.filterColumnsList=this.lists[event]
            this.filters.columnTable = null
            
            if(event === 'location'){
                this.locationSearch = true
            }
        },
                getLocationInfo() {
            const self = this;
            axios
                .get('/get-location-info')
                .then(function (response) {
                    self.province_municipalities = response.data.provinceMunicipalities;
                    self.municipalities = response.data.municipalities;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
        clearInputs(){
          this.filters= []
        },
        getDataFromApi() {
            const self = this;
            self.loading = true;
            var params = {};
            if (self.filters.searchInTable) {
                params['search'] = self.filters.searchInTable;
            }
              if (self.filters.type) {
                params['type'] = self.filters.type;
            }
            if (self.filters.columnTable) {
                params['columnTable'] = self.filters.columnTable;
            }
                  if (self.filters.startDate) {
                params['startDate'] = self.filters.startDate;
            }
                  if (self.filters.endDate) {
                params['endDate'] = self.filters.endDate;
            }
           if (self.filters.province_municipality) {
                params['province_municipality'] = self.filters.province_municipality;
            }
              if (self.filters.municipality) {
                params['municipality'] = self.filters.municipality;
            }
                  if (self.filters.plan_id) {
                params['plan_id'] = self.filters.plan_id;
            }
                    if (self.filters.piece_number) {
                params['piece_number'] = self.filters.piece_number;
            }
            axios
                .get(self.url, {
                    params: params,
                })
                .then(function(response) {
                    self.loading = false;
                    self.projectData = _.concat(self.projectData, response.data.projects.data);
                    self.reportData = _.concat(self.reportData, response.reports);
                    console.log(self.reportData,  self.projectData)
                    self.statuses = response.data.status;
                    self.url = _.get(response, 'data.projects.next_page_url', null);
                    self.getStatistics();
                })
                .catch(function(error) {
                    console.log(error);
                });
          },
                getFilterData() {
            const self = this;
         //   if (self.$can('superadmin')) {
                axios
                    .get('/projects/create')
                    .then(function(response) {
                        self.users = _.concat(self.users, response.data.data.users);
                        self.customers = _.concat(self.customers, response.data.data.customers);
                        self.status = _.concat(self.status, response.data.data.status);
                        self.categories = _.concat(self.categories, response.data.data.categories);
                        self.tasks = _.concat(self.categories, response.data.data.tasks);
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
         //   }
        },

        filterChanged() {
            const self = this;
            self.url = '/project/dataFilters';
            self.projectData = [];
            self.reportData = [];
            self.getDataFromApi();
        },
        getStatistics() {
            const self = this;
            if (self.$can('superadmin')) {
                axios
                    .get('/projects-statistics')
                    .then(function(response) {
                        self.statistics = response.data;
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
            }
        },
    }
}
</script>
