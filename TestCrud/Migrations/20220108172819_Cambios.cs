using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TestCrud.Migrations
{
    public partial class Cambios : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IdUser",
                table: "Operaciones");

            migrationBuilder.DropColumn(
                name: "IdGenero",
                table: "GeneroPelicula");

            migrationBuilder.DropColumn(
                name: "IdPelicula",
                table: "GeneroPelicula");

            migrationBuilder.RenameColumn(
                name: "MyProperty",
                table: "Peliculas",
                newName: "Duracion");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Duracion",
                table: "Peliculas",
                newName: "MyProperty");

            migrationBuilder.AddColumn<int>(
                name: "IdUser",
                table: "Operaciones",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "IdGenero",
                table: "GeneroPelicula",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "IdPelicula",
                table: "GeneroPelicula",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
