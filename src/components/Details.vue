<template>
    <div class="components">
        <div class="details">
            <p class="record-details">Record Details / {{ jsonData.id }}</p>
            <p class="icon-outline">
                <button><v-icon>mdi mdi-view-dashboard-edit-outline</v-icon></button>
            </p>
        </div>
        <div class="titles">
            <a href="#"
                :class="{ 'active': currentPage === 'overview', 'custom-color': currentPage === 'academic' || currentPage === 'enrollment' }">Overview</a>
            <a href="#" :class="{ 'custom-color': currentPage === 'overview' || currentPage === 'academic' }">Enrollment</a>
            <a href="#" :class="{ 'custom-color': currentPage === 'overview' || currentPage === 'enrollment' }">Academic</a>
        </div>
        <v-divider></v-divider>
        <div class="overview">
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi-calendar-today</v-icon>
                    </div>
                    <div>
                        <p class="record-age2">Record Age
                        <p class="record-age3"> {{ details.recordAge }}</p>
                        </p>
                    </div>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>Created On</p>
                    <p>{{ details.createdOn }}</p>
                </div>
            </v-card>
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi-check-circle</v-icon>
                    </div>
                    <div>
                        <p class="record-age2">Status<span class="mdi mdi-cog status"></span>
                        <p class="record-age3"> {{ details.status }}</p>
                        </p>
                    </div>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>Updated</p>
                    <p class="updated">{{ details.updated }}</p>
                </div>
            </v-card>
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi mdi-map-marker</v-icon>
                    </div>
                    <div>
                        <p class="record-age2 country">Country
                        <p class="record-age3"> {{ details.country }}</p>
                        </p>
                    </div>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>State</p>
                    <p class="state">{{ details.state }}</p>
                </div>
            </v-card>
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi mdi-file-account</v-icon>
                    </div>
                    <div>

                    </div>
                    <div>
                        <p class="record-age2 country">Last Contact
                        <p class="record-age3"> {{ lastContact.days }}</p>
                        </p>
                    </div>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>{{ lastContact.date }}</p>
                    <p class="hour">{{ lastContact.hour }}</p>
                </div>
            </v-card>
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi mdi-chart-timeline-variant</v-icon>
                    </div>
                    <div>
                        <p class="record-age2 country">Last Activity
                        <p class="record-age3"> {{ lastActivity.days }}</p>
                        </p>
                    </div>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>{{ lastActivity.date }}</p>
                    <p class="hour">{{ lastActivity.hour }}</p>
                </div>
            </v-card>
        </div>
        <div class="d-flex flex-column">
            <div class="activity">
                <button>
                    <p>Activity</p>
                </button>
                <button class="emails">
                    <p><v-icon>mdi-email</v-icon>Emails</p>
                </button>
                <button class="emails">
                    <p><v-icon>mdi mdi-phone</v-icon>Calls</p>
                </button>
            </div>
            <div style="background-color: white;" class="linea">
                <div class="timeline">
                    <p class="timeline-p">Timeline</p>
                    <div class="timeline-select">
                        <div class="custom-select">
                            <select class="selects" style="width: 84px; height: 38px;">
                                <option>Year</option>
                                <option class="option"></option>
                            </select>
                            <span class="mdi mdi-menu-down arrow-down"></span>
                        </div>
                        <div class="custom-select">
                            <select class="selects" style="width: 140px;height: 38px;">
                                <option>Filter by User</option>
                                <option class="option"></option>
                            </select>
                            <span class="mdi mdi-menu-down"></span>
                        </div>
                        <div class="custom-select">
                            <select class="selects" style="width: 243px;height: 38px;">
                                <option>Search</option>
                                <option class="option"></option>
                            </select>
                            <span class="mdi mdi-magnify"></span>
                        </div>
                    </div>
                </div>
                <div class="timeline-template">
                    <template>
                        <v-container>
                            <v-row justify="start">
                                <v-col cols="12" sm="8">
                                    <v-timeline>
                                        <p class="month">September 2023</p>
                                        <div v-for="item in timelineSeptember">
                                            <v-timeline-item>
                                                <template v-slot:icon>
                                                    <v-avatar color="#7367F0" size="36">
                                                        <v-icon style="font-size: 25px; border: 2px solid #DDDDDD;"
                                                            color="white">{{ item.icon }}</v-icon>
                                                    </v-avatar>
                                                </template>
                                                <div class="actions" style="background-color: #F0F0F0;">
                                                    <div class="d-flex justify-space-between">
                                                        <p><span style="color: #7367F0;">{{ item.action }}</span> by
                                                            {{ item.by }}</p>
                                                        <p>{{ item.date }}</p>
                                                    </div>
                                                    <p> {{ item.content }} <span style="color: #7367F0;">{{ item.status
                                                    }}</span></p>
                                                </div>
                                            </v-timeline-item>
                                        </div>
                                        <p class="month">August 2023</p>
                                        <div v-for="(item, index) in timelineAugust">
                                            <v-timeline-item>
                                                <template v-slot:icon>
                                                    <v-avatar color="#7367F0"
                                                        :size="index === 2 || index === 3 ? '18' : '36'">
                                                        <v-icon style="font-size: 25px; border: 2px solid #DDDDDD;"
                                                            color="white">{{ item.icon }}</v-icon>
                                                    </v-avatar>
                                                </template>
                                                <div :class="['actions', { 'first-august-item': index === 0 }, { 'call': index === 1 }]"
                                                    style="background-color: #F0F0F0;">
                                                    <div class="d-flex justify-space-between">
                                                        <p v-if="item.by && item.from"><span style="color: #7367F0;">{{
                                                            item.action }} </span>from {{ item.from }} by {{ item.by }}
                                                        </p>
                                                        <p v-else-if="item.from"><span style="color: #7367F0;">{{
                                                            item.action }} </span>from {{ item.from }}</p>
                                                        <p v-else="item.by"><span style="color: #7367F0;">{{ item.action }}
                                                            </span>by {{ item.by }}</p>
                                                        <p>{{ item.date }}</p>
                                                    </div>
                                                    <div v-show="index === 0">
                                                        <p class="for">For: {{ item.for }}</p>
                                                        <p class="for">Assignment Name: {{ item.assignmentName }}</p>
                                                        <p class="for">Grade: {{ item.grade }}</p>
                                                    </div>
                                                    <p style="height: 6px;">{{ item.content }} <span
                                                            style="color: #7367F0;">{{ item.status
                                                            }} </span>
                                                    </p>
                                                    <p v-show="index === 1" style="height: 8px;"> Call Duration: {{
                                                        item.callDuration }}
                                                    </p>
                                                </div>
                                            </v-timeline-item>
                                        </div>
                                        <p class="month">July 2023</p>
                                        <div v-for="item in timelineJuly">
                                            <v-timeline-item>
                                                <template v-slot:icon>
                                                    <v-avatar color="#7367F0" size="36">
                                                        <v-icon style="font-size: 25px; border: 2px solid #DDDDDD;"
                                                            color="white">{{ item.icon }}</v-icon>
                                                    </v-avatar>
                                                </template>
                                                <div class="actions" style="background-color: #F0F0F0; height: 87px;">
                                                    <div class="d-flex justify-space-between">
                                                        <p><span style="color: #7367F0;">{{ item.action }}</span> by
                                                            {{ item.from }}</p>
                                                        <p>{{ item.date }}</p>
                                                    </div>
                                                        <p style="height: 8px;"> {{ item.content }}</p>
                                                        <p style="height: 8px;">Call Duration: {{ item.callDuration }}</p>
                                                </div>
                                            </v-timeline-item>
                                        </div>
                                        <p class="month">June 2023</p>
                                        <div v-for="item in timelineJune">
                                            <v-timeline-item>
                                                <template v-slot:icon>
                                                    <v-avatar color="#7367F0" size="36">
                                                        <v-icon style="font-size: 25px; border: 2px solid #DDDDDD;"
                                                            color="white">{{ item.icon }}</v-icon>
                                                    </v-avatar>
                                                </template>
                                                <div class="actions" style="background-color: #F0F0F0;">
                                                    <div class="d-flex justify-space-between">
                                                        <p><span style="color: #7367F0;">{{ item.action }}</span> by
                                                            {{ item.by }}</p>
                                                        <p>{{ item.date }}</p>
                                                    </div>
                                                        <p style="height: 8px;"> {{ item.content }} <span
                                                            style="color: #7367F0;">{{ item.status
                                                            }} </span></p>
                                                </div>
                                            </v-timeline-item>
                                        </div>
                                    </v-timeline>
                                </v-col>
                            </v-row>
                        </v-container>
                    </template>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { jsonData } from '../json/menu';
import { timeline } from '../json/timeline';
export default {
    data() {
        return {
            jsonData: null,
            currentPage: 'overview',
            items: [],
            timelineSeptember: timeline.september,
            timelineAugust: timeline.august,
            timelineJuly: timeline.july,
            timelineJune: timeline.june

        };
    },
    mounted() {
        this.jsonData = jsonData.students[0];
        this.details = jsonData.students[0].details;
        this.lastContact = jsonData.students[0].details.lastContatct;
        this.lastActivity = jsonData.students[0].details.lastActivity;
    }
}
</script>
<style>
@import '../assets/Style/details.css';
</style>