import {listUser} from "@/api/system/user";

function getlist(){
   this.loading = true;
  listUser(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
      this.userList = response.rows;
      this.total = response.total;
      this.loading = false;

    }
  );
}
