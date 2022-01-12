using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TestCrud.Migrations
{
    public partial class a : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Peliculas_Operaciones_OperacionId",
                table: "Peliculas");

            migrationBuilder.DropIndex(
                name: "IX_Peliculas_OperacionId",
                table: "Peliculas");

            migrationBuilder.DropColumn(
                name: "OperacionId",
                table: "Peliculas");

            migrationBuilder.AddColumn<int>(
                name: "PeliculaId",
                table: "Operaciones",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Operaciones_PeliculaId",
                table: "Operaciones",
                column: "PeliculaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Operaciones_Peliculas_PeliculaId",
                table: "Operaciones",
                column: "PeliculaId",
                principalTable: "Peliculas",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Operaciones_Peliculas_PeliculaId",
                table: "Operaciones");

            migrationBuilder.DropIndex(
                name: "IX_Operaciones_PeliculaId",
                table: "Operaciones");

            migrationBuilder.DropColumn(
                name: "PeliculaId",
                table: "Operaciones");

            migrationBuilder.AddColumn<int>(
                name: "OperacionId",
                table: "Peliculas",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Peliculas_OperacionId",
                table: "Peliculas",
                column: "OperacionId");

            migrationBuilder.AddForeignKey(
                name: "FK_Peliculas_Operaciones_OperacionId",
                table: "Peliculas",
                column: "OperacionId",
                principalTable: "Operaciones",
                principalColumn: "Id");
        }
    }
}
