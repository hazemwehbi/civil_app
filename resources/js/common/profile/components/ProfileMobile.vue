<template>
  <div
    class="flex flex-col items-center"
    :class="mobile?'':'elevation-1 mx-auto my-2'"
  >
    <div class="header">
      <slot />
      <div class="header-bar row mx-auto ">
        <v-btn 
        to=""
        icon>
        <v-icon
          color="#fff"
          size="24"
          class="col-2"
        >
          mdi-square-edit-outline
        </v-icon>
        </v-btn>
        <span 
        :class="$vuetify.breakpoint.mdAndDown? 'col-9' : 'col-10'"
        class="text-center pa-0"
        >
        {{trans('data.basic_information')}}
        </span>
      </div>
      <img
        class="profile-img mx-auto"
        src="svg/profile.svg"
      />
    </div>
    <div class="mt-8 shadow-md rounded-2xl bg-white pa-3">
    <span class="personal-title">{{trans('messages.personal_data')}}</span>
    <v-container class="person-data">
      <div class="columns-2">
        <div class="my-2">
          {{trans('data.name')}}
        </div>
        <div class="my-2">
          {{trans('data.email_address')}}
        </div>
        <div class="my-2">
          {{trans('data.mobile')}}
        </div>
         <div class="my-2">
          {{getCurrentUser().name}}
        </div>
          <div class="my-2">
          {{getCurrentUser().email}}
        </div>
        <div class="my-2">
          {{getCurrentUser().mobile}}
        </div>
        </div>
    </v-container>
  </div>
    <div
      v-if="validate"
      class="text-right full-width pr-10 mt-6 mb-10"
    >
      <v-icon
        color="#fff"
        class="icon-validate ml-3"
      >
        mdi-account-check
      </v-icon>
      <span class="validate-text">تم الحقق من الحساب</span>
    </div>
    <cp-button
      v-if="validate"
      :label="trans('messages.edit')"
      background-color="#37D39B"
      class="mx-auto mt-3 mb-2"
      to=""
    />
  </div>
</template>

<script>
import CpButton from './CpButton'

export default {
  components: {
    CpButton
  },
  layout: 'cp/default',
  data () {
    return {
      validate: false,
      mobile: this.$vuetify.breakpoint.xsOnly,
    }
  },
  created () {
    this.validate = this.$route.query.validate
    console.log(this.$vuetify.breakpoint)
  },
}
</script>

<style lang="scss" scoped>
.btns-list{
  width: 80%;
}
.validate-text{

  color: #37d39b;
}
span{
  color: white;
}
  .header{
    width:100%;
    height:192px;
    background: linear-gradient(45deg, #3498DB, #2980B9);
    @apply from-slate-300;
  }
   .header:before {
    content: "";
    background: url('~/svg/header-shadow.svg');
    width: 402px;
    height:402px;
    opacity: 0.1;
   }
  .profile-img{
    position:absolute;
    width: 158px;
    height: 158px;
    border-radius: 50%;
    top: 91px;
    border: 4px solid #37D39B;
    right: calc(50% - 79px)
  }
  .header-bar{
    color: var(--v-anchor-base);
    margin-top: 25px;
  }
 .personal-title{
   color: var(--v-cpSecondary-base);
   opacity: 0.6;
   margin-top: 70px;
  width: 80%;
  font-weight: bold;
 }
 .person-data{
   width:87%;
 }
 .btns {
  width: 80%;
  justify-content: right;
  border-radius: 20px;
}

</style>
