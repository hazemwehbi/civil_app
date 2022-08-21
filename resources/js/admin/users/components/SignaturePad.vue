<template>
<v-layout row justify-center>
   <v-dialog
      v-model="dialog"
      width="500"
    >
      <v-card>
        <v-card-title
          class="headline grey lighten-4"
          primary-title
        >
          {{ trans('data.addSignature') }}
        </v-card-title>
         <VueSignaturePad  
            width="100%"
          height="250px"
           ref="signaturePad" 
            :options="options"/>
        <v-divider></v-divider>
 <v-card-actions>
          <v-spacer></v-spacer>
      <v-btn class="primary" @click="save">{{trans('data.save')}}</v-btn>
      <v-btn class="secondary" @click="undo">Undo</v-btn>
      <v-btn class="secondary" @click="dialog = false">{{trans('data.close')}}</v-btn>
    </v-card-actions>
     </v-card>
  </v-dialog>
   </v-layout>
</template>

<script>
export default {
 name: 'MySignaturePad',
 data(){
   return{
     dialog: false,
      options: {
        penColor: "#c0f",
        onBegin: () => {
          this.$refs.signaturePad.resizeCanvas();
        },
   }
 }
 },
  methods: {
    undo() {
      this.$refs.signaturePad.undoSignature();
    },
    save() {
      const { isEmpty, data } = this.$refs.signaturePad.saveSignature();
     // console.log(isEmpty);
     // console.log(data);
      this.$emit('save' ,data)
      this.dialog= false

    }
  }
}
</script>

<style scoped>

</style>