import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
async function main() {
  const admin = await prisma.user.upsert({
    where: { phone_number: '998999999999' },
    update: {},
    create: {
      firstName: 'admin',
      lastName: 'AdminLastName',
      password: 'admin',
      status: 'ACTIVE',
      phone_number: '998999999999',
    },
  });
  console.log({ admin });
}
main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
