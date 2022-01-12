using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TestCrud.Migrations
{
    public partial class unique : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_DNI",
                table: "AspNetUsers",
                column: "DNI",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_DNI",
                table: "AspNetUsers");
        }
    }
}
