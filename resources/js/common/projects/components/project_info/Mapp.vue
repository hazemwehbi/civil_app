<template>
    <div>
        <v-dialog v-model="dialog" width="1000">
            <div>
                <GmapMap
                    :center="center"
                    :zoom="8"
                    style="width: 100%; height: 400px"
                    ref="mapRef"
                    @click="handleMapClick"
                >
                    <GmapMarker
                        :position="marker.position"
                        :clickable="true"
                        :draggable="true"
                        @drag="handleMarkerDrag"
                        @click="panToMarker"
                    />
                </GmapMap>

                <!-- <button @click="geolocate">Detect Location</button>

            <p>Selected Position: {{ marker.position }}</p> -->
                <!-- <v-divider></v-divider> -->
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color=" darken-1" style="color: #06706d" @click="dialog = false">
                        {{ trans('messages.close') }}
                    </v-btn>
                    <!-- <v-btn
                    style="background-color: #06706d; color: white"
                    @click="store"
                    :loading="loading"
                    :disabled="loading"
                >
                    {{ trans('messages.save') }}
                </v-btn> -->
                </v-card-actions>
            </div>
        </v-dialog>
    </div>
</template>

<script>
export default {
    name: 'GoogleMap',
    data() {
        return {
            marker: { position: { lat: 10, lng: 10 } },
            center: { lat: 10, lng: 10 },

            mapOptions: {
                disableDefaultUI: true,
            },
            dialog: false,
            loading: false,
        };
    },

    mounted() {
        this.geolocate();
    },
    methods: {
        //detects location from browser
        geolocate(){
           
            navigator.geolocation.getCurrentPosition((position) => {
                this.center = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude,
                };
            });
        },

        //sets the position of marker when dragged
        handleMarkerDrag(e) {
            this.marker.position = { lat: e.latLng.lat(), lng: e.latLng.lng() };
        },

        //Moves the map view port to marker
        panToMarker() {
            this.$refs.mapRef.panTo(this.marker.position);
            this.$refs.mapRef.setZoom(10);
        },

        //Moves the marker to click position on the map
        handleMapClick(e) {
            this.marker.position = { lat: e.latLng.lat(), lng: e.latLng.lng() };
            this.$emit('fillCordinate', { lat: e.latLng.lat(), lon: e.latLng.lng() });
            console.log(e);
        },

        create() {
            const self = this;
            self.dialog = true;
        },
    },
};
</script>