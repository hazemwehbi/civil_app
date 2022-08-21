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
       <h3> {{trans('data.reports')}}</h3>
      </v-tab>
       <v-tab
      >
         <h3> {{trans('data.all_report_types')}}</h3>
      </v-tab>
    </v-tabs>
     <v-tabs-items v-model="tab">
      <v-tab-item
      >
  <v-card flat class="mx-5 elevation-2 px-5 pt-1 pb-3 my-2 report" style="min-width:70%;flex:4">
  <Report  />
  <v-btn class="mx-auto" style="color: #06706d" @click="$router.go(-1)">
                        {{ trans('messages.back') }}
                    </v-btn>
  </v-card>
  </v-tab-item>
      <v-tab-item>
  <v-card flat class="mx-5 elevation-2 px-5 pt-1 pb-3 my-2" style="min-width:70%;flex:4">
   <ReportTypes  />
   <v-btn class="mx-auto" style="color: #06706d" @click="$router.go(-1)">
                        {{ trans('messages.back') }}
                    </v-btn>
  </v-card>

  </v-tab-item>
     
  </v-tabs-items>
  </div>
</template>

<script>
import ReportTypes from '../report_types/List.vue'
import Report from '../reports/List.vue'
export default {
 components:{
  Report,
     ReportTypes
    },
    data: () => ({
      tab: null,
    }),
}
</script>

<style scoped>
.report{
    display: flex;
    flex-direction: column;
}
</style>