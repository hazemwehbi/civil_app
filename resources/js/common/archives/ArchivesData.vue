<template>
    <div>
     <v-tabs
      v-model="tab"
      background-color="transparent"
      color="basil"
      class="mx-5"
      grow
    >
      <v-tab
      >
       <h3> {{trans('data.projects')}}</h3>
      </v-tab>
       <v-tab
      >
         <h3> {{trans('data.reports')}}</h3>
      </v-tab>
    </v-tabs>
     <v-tabs-items v-model="tab">
      <v-tab-item
      >
  <v-card flat class="mx-5 elevation-2 px-5 pt-1 pb-3 my-2" style="min-width:70%;flex:4">
  <ProjectFilters  :projects="true" :reports="false"/>
  <v-btn class="mx-auto" style="color: #06706d" @click="$router.go(-1)">
                        {{ trans('messages.back') }}
                    </v-btn>
  </v-card>
  </v-tab-item>
      <v-tab-item>
  <v-card flat class="mx-5 elevation-2 px-5 pt-1 pb-3 my-2" style="min-width:70%;flex:4">
   <ProjectFilters :reports="true" :projects="false" />
   <v-btn class="mx-auto" style="color: #06706d" @click="$router.go(-1)">
                        {{ trans('messages.back') }}
                    </v-btn>
  </v-card>

  </v-tab-item>
     
  </v-tabs-items>
   
    </div>
</template>
<script>
import ProjectFilters from './components/ProjectsFilters.vue'

  export default {
    components:{
     ProjectFilters
    },
    data: () => ({
      tab: null,
    }),
    methods:{
    }
  }
</script>
<style scoped>
.content{
  display: flex;
  flex-direction: row!important;
  height: 100%;
  width: 100%;
}
</style>